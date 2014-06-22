
makeTidyData <- function() {

#test for package reshape2, installation if necessary
if (!is.element("reshape2", installed.packages()[,1])) install.packages("reshape2")
library(reshape2)

#Read Original Dataset
Xtest <- read.table(paste(getwd(), "UCI HAR Dataset/test", "X_test.txt", sep="/"))
Ytest <- read.table(paste(getwd(), "UCI HAR Dataset/test", "Y_test.txt", sep="/"))
Stest <- read.table(paste(getwd(), "UCI HAR Dataset/test", "subject_test.txt", sep="/"))
Xtrain <- read.table(paste(getwd(), "UCI HAR Dataset/train", "X_train.txt", sep="/"))
Ytrain <- read.table(paste(getwd(), "UCI HAR Dataset/train", "y_train.txt", sep="/"))
Strain <- read.table(paste(getwd(), "UCI HAR Dataset/train", "subject_train.txt", sep="/"))

#Read feature description file and Activity description file
col <- read.table(paste(getwd(), "UCI HAR Dataset", "features.txt", sep="/"))
act <- read.table(paste(getwd(), "UCI HAR Dataset", "activity_labels.txt", sep="/"))

#Merge train set and test set
Xtt <- rbind(Xtest,Xtrain)
Ytt <- rbind(Ytest,Ytrain)
Stt <- rbind(Stest,Strain)


#Change column names with proper feature description
colnames(Xtt) <- col[,2]
#Add new column Activity description with proper activity description
Ytt$ActivityDesc <-act[Ytt$V1,2]

#Filter unwanted column to keep only mean() and std() columns
keep <- c(grep(".*mean\\(\\).*", colnames(Xtt)),grep(".*std\\(\\).*", colnames(Xtt)))
Step2 <- Xtt[ keep]



#Finis the merge in only one unique dataframe
Datatemp <- cbind(Stt,Ytt, Step2)

#Cleaning column names
names(Datatemp)[1] <- "SubjectId"
names(Datatemp)[2] <- "ActvitiyId"

#Creating second data set, according to instructions
Datamelt <- melt(Datatemp,id=c(1:3),variables=c(4:ncol(Datatemp)))
DataTidy <- dcast(Datamelt,SubjectId + ActivityDesc ~ variable, mean)

#Cleaning column names further, changing - to _ and removing ()
NewCol <-gsub("\\-","\\_", colnames(DataTidy))
NewCol <-gsub("\\(","", NewCol)
NewCol <-gsub("\\)","", NewCol)
colnames(DataTidy) <- NewCol

#Output dataset
DataTidy

}