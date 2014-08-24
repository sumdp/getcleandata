```{r}

#import dplyr library - makes life easier!
library(dplyr)
#import reshape2 library - thank you Hadley Wickham!
library(reshape2)

#Read data tables from the files provided
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", quote="\"", stringsAsFactors=FALSE)
features <- read.table("./UCI HAR Dataset/features.txt", quote="\"", stringsAsFactors=FALSE)
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt", quote="\"")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt", quote="\"")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt", quote="\"")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt", quote="\"")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", quote="\"")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", quote="\"")

#give features appropriate labels
names(features) <- c("featureNo.", "sensor_measurement_description")
#rename columns for training and test data (from labelled features)
names(X_test) <- features$sensor_measurement_description
names(X_train) <- features$sensor_measurement_description
#rename activity label columns
names(activity_labels) <- c("activity_label", "activity_description")
#rename y_test and y_train columns
names(y_test) <- c("activity_label")
names(y_train) <- c("activity_label")
#merge y_test & y_train data with activity labels using dplyr inner_join (keeps order of dataframe)
y_test_labelled <- inner_join(y_test, activity_labels) #this function keeps order of dataframe
y_train_labelled <- inner_join(y_train, activity_labels) #this function keeps order of dataframe

#rename subject_test and subject_train - provide column headings
names(subject_test) <- c("subject")
names(subject_train) <- c("subject")

#join the X_train data with the subject who performed the activity and include activity labels/descriptors
training_data <- cbind(X_train, subject_train, y_train_labelled)
#repeat this process for X_test data: join the X_test data with the subject who performed the activity and include activity labels/descriptors
test_data <- cbind(X_test, subject_test, y_test_labelled)
#combine the two dataframes into single dataframe including Training & Testing datasets: X_train & X_test
complete_data <- rbind(training_data, test_data)

#find variable names to extract
grep("mean\\(\\)|std\\(\\)", names(complete_data), value=TRUE)
#select columns from dataset which match specified grep commands (subset on mean & std)
extracted_columns <- complete_data[,grep("mean\\(\\)|std\\(\\)|subject|activity_description", names(complete_data), value=TRUE)]
#extract variable names for this dataset
namesVector <- names(extracted_columns)
#clean variable names
namesVector <- gsub("\\(\\)","",namesVector)
namesVector <- gsub("-","_",namesVector)
#update variable names that are now clean & descriptive
names(extracted_columns) <- namesVector
#melt data
meltdata <- melt(extracted_columns, id=c("subject", "activity_description"))
cdata <- dcast(meltdata, subject + activity_description ~ variable, mean)
#write file to upload as submission of Course Project for Getting and Cleaning Data - Coursera
write.table(cdata, file = "average_tidy_data.txt", row.name=FALSE)
```
