getcleandata
============

##Course Project for Coursera: Getting and Cleaning Data

###Introduction

The purpose of this project is to demonstrate an ability to collect, work with, and clean a data set. The goal was to prepare tidy data that can be used for later analysis. The provided sample data was around wearable computing. Specifically, data collected from the accelerometers from the Samsung Galaxy S smartphone. 

A full description of the data is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Original data for the project can be found here: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The main file for this project is the following R script: run_analysis.R

The dependencies of run_analysis.R are the following libraries: dplyr, reshape2. These are both Hadley Wickham libraries which are loaded before commencing any data manipulation/download using: library(dplyr), library(reshape2)

This script completes the necessary 5 steps as directed from the course project instructions:

1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement. 
3) Uses descriptive activity names to name the activities in the data set
4) Appropriately labels the data set with descriptive variable names. 
5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

###Logic
My logic was to read all the data tables from the data file provided. I then labelled the data accordingly before merging as I found this easier. Labelling features with appropriate labels and giving descriptive column names for the training and test data allowed me to visualize the merging required. Also helped in later stages of the project, as I had already lined the class labels with their activity name.

Merging the y_test & y_train data with activity labels using dplyr inner_join was one of the benefits of using the dplyr package as this keeps the order of dataframe. This was the reason I chose this method over the base package.

Next I created the necessary dataframe with all the required test/training data with the associated labels for the subject who performed the activity and activity labels/descriptors. 

In order to extract the signals needed to estimate mean/std variables of the feature vector I used a grep command to find variable names to extract - selected only columns including:  
"mean()" - Mean value and 
"std()" - Standard deviation 

I excluded:
meanFreq(): Weighted average of the frequency components -> not interested in mean frequency
gravityMean, tBodyAccMean, tBodyAccJerkMean, tBodyGyroMean, tBodyGyroJerkMean: as these were additional vectors obtained by averaging the signals in a signal window sample

Upon cleaning and updating variable names that were clean & descriptive I could perform an optional sanity check by tabulating the data to see which subject performed what activity (this helps me to see where I stand and observe the data).

Then I used the reshape2 library to simplify melting the dataframe by subject and activity description and casting the data in a tidy format - 180 obs. of 68 variables.

Final step was to write the file with tidy data to upload as submission of Course Project using write.table() as specified.