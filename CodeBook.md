

====================================================================================

The data set is based on the SAMSUNG dataset provided in the assignment instructions

====================================================================================

#Base features from SAMSUNG Dataset
(please read the Readme.txt from the original dataset for further details)

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

Features are normalized and bounded within [-1,1].

As a result, we get a total of 66 measures per lines



# Contents of new Dataset

* Each record provides measures for one activity and one test subject
* Each record contains the mean of the original features per activity/subject

# Modifications done to the Dataset

* Test and Train files from original Dataset have been merged
* X, Y and subject files have also been merged
* Activity description column has been added
* Only features regarding mean value and standard deviation have been kept
* Columns name have been added from the feature description file of the original dataset.
* Slight cleaning of the columns names, replacing - by _ and removing (), for increased readability and easier use in R
* Original Dataset has been aggregated in order to get, for each pair Activity/Subject, the mean of the records, for every feature