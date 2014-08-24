getcleandata
============

##Course Project for Coursera: Getting and Cleaning Data

The purpose of this project is to demonstrate an ability to collect, work with, and clean a data set. The goal was to prepare tidy data that can be used for later analysis. The provided sample data was around wearable computing. Specifically, data collected from the accelerometers from the Samsung Galaxy S smartphone. 

A full description of the data is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Original data for the project can be found here: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The main file for this project is the following R script: run_analysis.R

The dependencies of run_analysis.R are the following libraries: dplyr, reshape2

These are both Hadley Wickham libraries which are loaded before commencing any data manipulation/download using: library(dplyr), library(reshape2)

This script completes the necessary 5 steps as directed from the course project instructions:

1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for each measurement. 
3) Uses descriptive activity names to name the activities in the data set
4) Appropriately labels the data set with descriptive variable names. 
5) Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


My logic was to read all the data tables from the data file provided. I then labelled the data accordingly before merging as I found this easier. Labelling features with appropriate labels and giving descriptive column names for the training and test data allowed me to visualize the merging required. 

#Rename activity label columns: links the class labels with their activity name.
names(activity_labels) <- c("activity_label", "activity_description")
#Rename y_test and y_train labels to specify activity name
names(y_test) <- c("activity_label")
names(y_train) <- c("activity_label")
#Merge y_test & y_train data with activity labels using dplyr inner_join (keeps order of dataframe -> benefit of using dplyr package)
y_test_labelled <- inner_join(y_test, activity_labels) #this function keeps order of dataframe and merges test data with corresponding activity labels
y_train_labelled <- inner_join(y_train, activity_labels) #this function keeps order of dataframe and merges training data with corresponding activity labels

#Rename subject_test and subject_train columns - provide column headings for subject_train/subject_test
names(subject_test) <- c("subject") # identifies the subject who performed the activity for each window sample in test data set
names(subject_train) <- c("subject") # identifies the subject who performed the activity for each window sample in training data set

Created the necessary dataframe with all the required test/training data with the associated labels for the subject who performed the activity and activity labels/descriptors

IN order to extract 

###Find variable names to extract - select only columns including: "mean()" - Mean value and "std()" - Standard deviation for signals needed to estimate variables of the feature vector. 
####Excluding:
#meanFreq(): Weighted average of the frequency components -> not interested in mean frequency
#gravityMean, tBodyAccMean, tBodyAccJerkMean, tBodyGyroMean, tBodyGyroJerkMean: additional vectors obtained by averaging the signals in a signal window sample

#Extract variable names for this dataset
#Clean variable names to provide descriptive names:
#Update variable names that are now clean & descriptive

#Optional: Tabulate data to see which subject performed what activity (this helps me to see where I stand and observe the data)
#Melt dataframe by subject and activity description
#Cast data in tidy format 
#Write file with tidy data to upload as submission of Course Project for Getting and Cleaning Data - Coursera
write.table() 