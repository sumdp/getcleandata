```

#import dplyr library - makes life easier!
library(dplyr)
#import reshape2 library - thank you Hadley Wickham!
library(reshape2)

#Read data tables from the downloaded zip file provided
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", quote="\"", stringsAsFactors=FALSE) # Activity labels
features <- read.table("./UCI HAR Dataset/features.txt", quote="\"", stringsAsFactors=FALSE) # List of all features
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", quote="\"") # Test set
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", quote="\"") # Training set
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", quote="\"") # Test labels
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", quote="\"") # Train labels
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", quote="\"") # identifies the subject who performed the activity in test data
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", quote="\"") # identifies the subject who performed the activity  in trainig data

#Label features with appropriate labels: features come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ
names(features) <- c("featureNo.", "sensor_measurement_description")
#Provide descriptive column names for training and test data (from feature labels)
names(X_test) <- features$sensor_measurement_description
names(X_train) <- features$sensor_measurement_description
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

#Create single dataframe for X_train data: merge the X_train data with subject who performed the activity and include activity labels/descriptors
training_data <- cbind(X_train, subject_train, y_train_labelled)
#Repeat this process for X_test data: merge the X_test data with the subject who performed the activity and include activity labels/descriptors
test_data <- cbind(X_test, subject_test, y_test_labelled)
#Combine the two dataframes into single dataframe including Training & Testing datasets: X_train & X_test (includes activity labels/descriptors)
complete_data <- rbind(training_data, test_data)

#Find variable names to extract - select only columns including: "mean()" - Mean value and "std()" - Standard deviation for signals needed to estimate variables of the feature vector.
grep("mean\\(\\)|std\\(\\)", names(complete_data), value=TRUE)
#Select columns from dataset which match specified grep commands (subset on mean & std)
#Excluding:
#meanFreq(): Weighted average of the frequency components -> not interested in mean frequency
#gravityMean, tBodyAccMean, tBodyAccJerkMean, tBodyGyroMean, tBodyGyroJerkMean: additional vectors obtained by averaging the signals in a signal window sample
extracted_columns <- complete_data[,grep("mean\\(\\)|std\\(\\)|subject|activity_description", names(complete_data), value=TRUE)]
#Extract variable names for this dataset
namesVector <- names(extracted_columns)
#Clean variable names to provide descriptive names:
namesVector <- gsub("\\(\\)","",namesVector)
namesVector <- gsub("-","_",namesVector)
#Update variable names that are now clean & descriptive
names(extracted_columns) <- namesVector
#Optional: Tabulate data to see which subject performed what activity (thi helps me to see where I stand and observe the data)
table(extracted_columns$subject, extracted_columns$activity_description)
#Melt dataframe by subject and activity description
meltdata <- melt(extracted_columns, id=c("subject", "activity_description"))
#Cast data in tidy format
cdata <- dcast(meltdata, subject + activity_description ~ variable, mean)
#Write file with tidy data to upload as submission of Course Project for Getting and Cleaning Data - Coursera
write.table(cdata, file = "average_tidy_data.txt", row.name=FALSE)

```