#Getting and Cleaning Data Project

Long Huynh 
26/09/2015

#Description

The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. This repo contains:

1) A run_analysis.R script which cleans the source data into a single tidy and clean table which is appropriately labelled with descriptive variable names. The tidy set contains the averages of each variable for each activity and each subject.

2) A README.md explaining how the script works and how the raw data sources are connected

3) A CodeBook.md describes the variables, the data, and transformations that were performed to clean up the data. 

4) A Tidy_Dataset.txt file which provides a tidy data set with the average of each variable: Subject, Activity and Measurement.

The full description of the data used in this project can be found at The UCI Machine Learning Repository [here][2]. The source data for this project can be found [here][1]

## How are the raw data connected

The raw data for this project are shown below:

 * **activity_labels.txt**: The activities that were perfomed by the subjects.
 * **features.txt**: The list of measures that were captured when testing the subjects.
 * **subject_test.txt**: The IDs for subjects performing each activity from the test dataset.
 * **Y_test.txt**: The ID for the activities performed from the test dataset.
 * **X_test.txt**: The measurements captured from the test dataset.
 * **subject_train.txt**: The IDs for subjects performing each activity from the train dataset.
 * **Y_train.txt**: The ID for the activities performed from the train dataset.
 * **X_train.txt**: The measurements captured from the train data-set.

The data-set has been randomly partitioned into two sets, where 70% of volunteers are selected for generating the training data (found in the train folder) and 30% in the test data (found in the test folder). 
The activity_labels.txt data set is linked to Y txt files. This txt file can be used to provide a readable description of the activities that were performed from the main datasets. The X text files are linked to the the features.txt file where the column headers are based on each of the observations found on the feature.txt file. The subject text files represent the subject that performed the activities. Finally the Subject, Y and X text files can be column binded to make one data frame as each observations from each of the tables are connected to one another.

## How the R script works
The R script performs the following operations against the raw data:

 1. Downloads the zip file and extracts the dataset only if the folder currently does not exists. If the folder exists then it ignores this command.
 2. Reads the activity labels tables and rename the column headers to make it easy for others to understand.
 3. Read the features tables. This provides us with the column headers for each of variables found in the X tables. It only extract the data for the mean and standard deviation variables. It then tidies and cleans the features measurement table for easy reading. Its converted into a vector to be used as the columns names for the X data sets.
 4. Reads and column binds the subjects, activities and measurements (for both Test and Train data sets) into one table.
 5. First independent tidy data set combines the test and train datasets. Reshaped for reading and filtering
 6. Second independent tidy data set with average of each variable for each: Subject, Activity and Measurement. The summary data is then written into a text file which is found on this repo.


[1]: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
[2]:http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones