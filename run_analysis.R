## Load libraries: Hadley Wickham is a legend!
library(dplyr)
library(tidyr)

## Download the zip file and extract the dataset if the folder currently does not exists
## If the folder exists ignore.

if (!file.exists("GetDataProjectFiles.zip")){
    fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileURL, "GetDataProjectFiles.zip")
}  
if (!file.exists("UCI HAR Dataset")) { 
    unzip("GetDataProjectFiles.zip") 
}

## Read the activity labels tables and rename the column headers to help understand each column
tblActivityLabels <-read.table("./UCI HAR Dataset/activity_labels.txt") %>% 
                    rename(ID_AL=V1,ActivityType=V2)

## Read the features tables. This provides us with the column headers for variables
tblFeatures <- read.table("./UCI HAR Dataset/features.txt")

## Extract data for the mean and standard deviation only
intFeaturesWanted <- grep(".*mean*|*std*", tblFeatures$V2) ##provides column numbers for mean and sd
tblFeatures <- filter(tblFeatures,grepl("*mean*|*std*",tblFeatures$V2))

## Tidy and clean the features measurement table for easy reading
tblFeatures.names <- tblFeatures %>% 
                     select(V2) %>% 
                     mutate(V2=gsub('mean','Mean',V2)) %>% 
                     mutate(V2=gsub('std','Std',V2)) %>% 
                     mutate(V2=gsub('[:():]','',V2))

## Read and column bind the subjects, actvities and measurments into one table
tblTest <- bind_cols(
                    read.table("./UCI HAR Dataset/test/subject_test.txt"),
                    read.table("./UCI HAR Dataset/test/Y_test.txt"),
                    read.table("./UCI HAR Dataset/test/X_test.txt")[intFeaturesWanted]) %>% 
                    setNames(c("Subject", "Activity", as.vector(tblFeatures.names[,1])))
                
tblTrain <- bind_cols(
                    read.table("./UCI HAR Dataset/train/subject_train.txt"),
                    read.table("./UCI HAR Dataset/train/Y_train.txt"),
                    read.table("./UCI HAR Dataset/train/X_train.txt")[intFeaturesWanted]) %>% 
                    setNames(c("Subject", "Activity", as.vector(tblFeatures.names[,1])))

## Part 1: First independent tidy data set combines the test and train datasets.
##          - Reshaped for reading and filtering
tblTidyDataSet <- bind_rows(tblTest,tblTrain) %>% 
                  gather(Measurement_Type,Measure_Value,-Subject,-Activity)  %>% 
                  mutate(Subject=as.factor(Subject),
                         Activity = factor(Activity, 
                         levels = tblActivityLabels$ID_AL, 
                         labels = tblActivityLabels$ActivityType))

## Part 2: Second independent tidy data set with average of each variable for each: 
##          - Subject, Activity and Measurement
tblSummaryDataset <- tblTidyDataSet %>%  
                     group_by(Subject,Activity,Measurement_Type) %>% 
                     summarise(Measure_Value=mean(Measure_Value))
write.table(tblSummaryDataset,"Tidy_Dataset.txt", row.names = FALSE)