COOKBOOK FOR COURSE PROJECT

Feature Selection
	The features selected for this dataset come from merging, joining and summarizing the features form the Human Activity Recognition Using Smartphones Dataset.

From features_info.txt:
------Start features_info.txt---
The original features selected for this database were accelerometer and gyroscope 3-axial
raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were originally  captured at a constant rate of 50 Hz. They were then filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
---End features_info.txt---

Subsequently, the original dataset was then modified by merging, joining and summarizing for each feature we computed the mean and standard deviation by subject and activity. This resulted in a final tidy dataframe: 180 obs. of 68 variables, consisting of:

Note: '_XYZ' is used to denote 3-distinct variables (_X, _Y and _Z) calculating the mean/std in the X, Y and Z directions. 

tBodyAcc_mean_XYZ
tBodyAcc_std_XYZ
tGravityAcc_mean_XYZ
tGravityAcc_std_XYZ
tBodyAccJerk_mean_X
tBodyAccJerk_std_Y
tBodyGyro_mean_XYZ
tBodyGyro_std_XYZ
tBodyGyroJerk_mean_XYZ
tBodyGyroJerk_std_XYZ
tBodyAccMag_mean_XYZ
tBodyAccMag_std_XYZ
tGravityAccMag_mean
tGravityAccMag_std
tBodyAccJerkMag_mean
tBodyAccJerkMag_std
tBodyGyroMag_mean
tBodyGyroMag_std
tBodyGyroJerkMag_mean
tBodyGyroJerkMag_std
fBodyAcc_mean_XYZ
fBodyAcc_std_XYZ
fBodyAccJerk_mean_XYZ
fBodyAccJerk_std_XYZ
fBodyGyro_mean_XYZ
fBodyGyro_std_XYZ
fBodyAccMag_mean
fBodyAccMag_std
fBodyAccJerkMag_mean
fBodyAccJerkMag_std
fBodyGyroMag_mean
fBodyGyroMag_std
fBodyGyroJerkMag_mean
fBodyGyroJerkMag_std

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

The complete list of variables of each feature vector is available below:


List of variables & type

subject                  : int
Identifies the subject who performed the activity in test data, the experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years.
Range: 1-30
activity_description     : chr
Activity description for six activities
Includes: LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS

Accelerometer and gyroscope 3-axial raw signals tAcc-XYZ
Mean of the triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
Mean The body acceleration signal obtained by subtracting the gravity from the total acceleration. 

tBodyAcc_mean_X          : num  
tBodyAcc_mean_Y          : num  
tBodyAcc_mean_Z          : num  

tBodyAcc_std_X           : num  
tBodyAcc_std_Y           : num  
tBodyAcc_std_Z           : num  

tGravityAcc_mean_X       : num  
tGravityAcc_mean_Y       : num  
tGravityAcc_mean_Z       : num  

tGravityAcc_std_X        : num  
tGravityAcc_std_Y        : num  
tGravityAcc_std_Z        : num  

tBodyAccJerk_mean_X      : num  
tBodyAccJerk_mean_Y      : num  
tBodyAccJerk_mean_Z      : num  

tBodyAccJerk_std_X       : num  
tBodyAccJerk_std_Y       : num  
tBodyAccJerk_std_Z       : num  

tBodyGyro_mean_X         : num  
tBodyGyro_mean_Y         : num  
tBodyGyro_mean_Z         : num  

tBodyGyro_std_X          : num  
tBodyGyro_std_Y          : num  
tBodyGyro_std_Z          : num  

tBodyGyroJerk_mean_X     : num  
tBodyGyroJerk_mean_Y     : num  
tBodyGyroJerk_mean_Z     : num  

tBodyGyroJerk_std_X      : num  
tBodyGyroJerk_std_Y      : num  
tBodyGyroJerk_std_Z      : num  

tBodyAccMag_mean         : num  
tBodyAccMag_std          : num  

tGravityAccMag_mean      : num  
tGravityAccMag_std       : num  

tBodyAccJerkMag_mean     : num  
tBodyAccJerkMag_std      : num  

tBodyGyroMag_mean        : num  
tBodyGyroMag_std         : num  

tBodyGyroJerkMag_mean    : num  
tBodyGyroJerkMag_std     : num  

fBodyAcc_mean_X          : num  
fBodyAcc_mean_Y          : num  
fBodyAcc_mean_Z          : num  

fBodyAcc_std_X           : num  
fBodyAcc_std_Y           : num  
fBodyAcc_std_Z           : num  

fBodyAccJerk_mean_X      : num  
fBodyAccJerk_mean_Y      : num  
fBodyAccJerk_mean_Z      : num  

fBodyAccJerk_std_X       : num  
fBodyAccJerk_std_Y       : num  
fBodyAccJerk_std_Z       : num  

fBodyGyro_mean_X         : num  
fBodyGyro_mean_Y         : num  
fBodyGyro_mean_Z         : num  

fBodyGyro_std_X          : num  
fBodyGyro_std_Y          : num  
fBodyGyro_std_Z          : num  

fBodyAccMag_mean         : num  
fBodyAccMag_std          : num  

fBodyBodyAccJerkMag_mean : num  
fBodyBodyAccJerkMag_std  : num  

fBodyBodyGyroMag_mean    : num  
fBodyBodyGyroMag_std     : num  

fBodyBodyGyroJerkMag_mean: num  
fBodyBodyGyroJerkMag_std : num 