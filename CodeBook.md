#Getting and Cleaning Data Project: Code book

Long Huynh 
26/09/2015

This code book describes each of the variables and observations found the Tidy_Dataset.txt file and provides a brief description of how the data was transformed. 

## Table Dimensions
The table contains 14,220 observations and 4 variables.
0.30MB

##Variables
 **Subject**: Factor Variable: 30 Levels

 * 1 to 30 subjects

**Activity**: Factor Variable: 6 Levels

 * WALKING
 * WALKING_UPSTAIRS
 * WALKING_DOWNSTAIRS
 * SITTING
 * STANDING
 * LAYING

**Measurement_Type**: Factor Variable: 79 Levels

* tBodyAcc-Mean-X
* tBodyAcc-Mean-Y
* tBodyAcc-Mean-Z
* tBodyAcc-Std-X
* tBodyAcc-Std-Y
* tBodyAcc-Std-Z
* tGravityAcc-Mean-X
* tGravityAcc-Mean-Y
* tGravityAcc-Mean-Z
* tGravityAcc-Std-X
* tGravityAcc-Std-Y
* tGravityAcc-Std-Z
* tBodyAccJerk-Mean-X
* tBodyAccJerk-Mean-Y
* tBodyAccJerk-Mean-Z
* tBodyAccJerk-Std-X
* tBodyAccJerk-Std-Y
* tBodyAccJerk-Std-Z
* tBodyGyro-Mean-X
* tBodyGyro-Mean-Y
* tBodyGyro-Mean-Z
* tBodyGyro-Std-X
* tBodyGyro-Std-Y
* tBodyGyro-Std-Z
* tBodyGyroJerk-Mean-X
* tBodyGyroJerk-Mean-Y
* tBodyGyroJerk-Mean-Z
* tBodyGyroJerk-Std-X
* tBodyGyroJerk-Std-Y
* tBodyGyroJerk-Std-Z
* tBodyAccMag-Mean
* tBodyAccMag-Std
* tGravityAccMag-Mean
* tGravityAccMag-Std
* tBodyAccJerkMag-Mean
* tBodyAccJerkMag-Std
* tBodyGyroMag-Mean
* tBodyGyroMag-Std
* tBodyGyroJerkMag-Mean
* tBodyGyroJerkMag-Std
* fBodyAcc-Mean-X
* fBodyAcc-Mean-Y
* fBodyAcc-Mean-Z
* fBodyAcc-Std-X
* fBodyAcc-Std-Y
* fBodyAcc-Std-Z
* fBodyAcc-MeanFreq-X
* fBodyAcc-MeanFreq-Y
* fBodyAcc-MeanFreq-Z
* fBodyAccJerk-Mean-X
* fBodyAccJerk-Mean-Y
* fBodyAccJerk-Mean-Z
* fBodyAccJerk-Std-X
* fBodyAccJerk-Std-Y
* fBodyAccJerk-Std-Z
* fBodyAccJerk-MeanFreq-X
* fBodyAccJerk-MeanFreq-Y
* fBodyAccJerk-MeanFreq-Z
* fBodyGyro-Mean-X
* fBodyGyro-Mean-Y
* fBodyGyro-Mean-Z
* fBodyGyro-Std-X
* fBodyGyro-Std-Y
* fBodyGyro-Std-Z
* fBodyGyro-MeanFreq-X
* fBodyGyro-MeanFreq-Y
* fBodyGyro-MeanFreq-Z
* fBodyAccMag-Mean
* fBodyAccMag-Std
* fBodyAccMag-MeanFreq
* fBodyBodyAccJerkMag-Mean
* fBodyBodyAccJerkMag-Std
* fBodyBodyAccJerkMag-MeanFreq
* fBodyBodyGyroMag-Mean
* fBodyBodyGyroMag-Std
* fBodyBodyGyroMag-MeanFreq
* fBodyBodyGyroJerkMag-Mean
* fBodyBodyGyroJerkMag-Std
* fBodyBodyGyroJerkMag-MeanFreq

**Measurement_Value**: Double

* Average values against each subject, activity and measurement type.

##Transformations

The test and train data sets were row binded together to make one table. The activities IDs were changed into readable text values and the measurement activities were assigned to each of the column headers from the X datasets. The code reshapes the data to contain only 4 variables where the X columns have been reshaped into 2 variables:

 * Measurement_Type: Description of the measurement type
 * Measurement_Value: Values found attributed against each Measurement type.

The table is then summarised to showing only the mean values against the Subject, Activity and Measurement type which is shown in the Tidy_Dataset.txt file.