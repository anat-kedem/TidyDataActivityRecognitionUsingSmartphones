#Code Book
This Code Book describes the tidy data file "Mean_ActivityDataBySmartphones.txt", and refers to the original data.

---
##Source data
---
**Acknowlegement:** *Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012*

###Source Site:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
###Download link:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

###Relevant Data Set Information:
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

###Variables Information:
For each record in the dataset it is provided: 
  - Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
  - Triaxial Angular velocity from the gyroscope. 
  - A 561-feature vector with time and frequency domain variables. 
  - Its activity label. 
  - An identifier of the subject who carried out the experiment.

---
##Results Data
---
###Description
The resulted data is a tidy data of one table file named "Mean_ActivityDataBySmartphones.txt". The tidy data includes the average of each variable for each activity and each subject.

The following table shows the frame of the tidy data (see rows and variables description below):

Subject | Activity_Mean     | *variable1* | *variable2* |*(rest of variables)*
------- | :-------------------- | :-----------: | :-----------: | :----------------:
1       |Walking                |...          |...          |...
1       |WalkingUpstairs      |...          |...          |...
1       |WalkingDownstairs    |...          |...          |...
1       |Sitting               |...          |...          |...
1       |Standing              |...          |...          |...
1       |Laying                |...          |...          |...
2       |Walking               |...          |...          |...
2       |WalkingUpstairs      |...          |...          |...

Where (...) is the mean of the relevant data. For example, the value in row 1 column 3 is the mean of all measurements of activity "Walking" for *"variable1"* (see actual variable names below) for subject 1.

The full table includes 180 observation rows (beyond the one title row of the column names) and 86 variables. The total columns is 86 + 2 (variables + the subject code and activity name columns).

####Rows
The tidy data includes 180 observation rows. For each subject the tidy data includes 6 rows that contain means of six types of activity. 30 subjects multiple 6 rows = 180 rows.
####Variables
The tidy data includes 88 columns, from these 86 are variables and 2 are codes and names of the subjects and activities. From the original variables of the data (see the above link), the **mean and std variables** for the 3-axial signals in the X, Y and Z directions were used in the tidy data:

**Selected Main Variables:**
- mean()
- std()
- meanFreq()
- gravityMean
- tBodyAccMean
- tBodyAccJerkMean
- tBodyGyroMean
- tBodyGyroJerkMean

**The full names of the 86 variables and domain of the tidy data are listed below:**

The domain for names with "t" as in "tBodyAcc-mean-X" is time, and the domain for names with "f" as in "fBodyAcc-mean-X" is frequency. Domain described instead of units since in the source data all variables were normalized and bounded within [-1,1].

Column | Variable Name 
:----- | :------------ 
[3] | "tBodyAcc-mean-X"
[4] | "tBodyAcc-mean-Y"
[5] | "tBodyAcc-mean-Z"
[6] | "tBodyAcc-std-X"
[7] | "tBodyAcc-std-Y"
[8] | "tBodyAcc-std-Z"
[9] | "tGravityAcc-mean-X"
[10] | "tGravityAcc-mean-Y"
[11] | "tGravityAcc-mean-Z"
[12] | "tGravityAcc-std-X"
[13] | "tGravityAcc-std-Y"
[14] | "tGravityAcc-std-Z"
[15] | "tBodyAccJerk-mean-X"
[16] | "tBodyAccJerk-mean-Y"
[17] | "tBodyAccJerk-mean-Z"
[18] | "tBodyAccJerk-std-X"
[19] | "tBodyAccJerk-std-Y"
[20] | "tBodyAccJerk-std-Z"
[21] | "tBodyGyro-mean-X"
[22] | "tBodyGyro-mean-Y"
[23] | "tBodyGyro-mean-Z"
[24] | "tBodyGyro-std-X"
[25] | "tBodyGyro-std-Y"
[26] | "tBodyGyro-std-Z"
[27] | "tBodyGyroJerk-mean-X"
[28] | "tBodyGyroJerk-mean-Y"
[29] | "tBodyGyroJerk-mean-Z"
[30] | "tBodyGyroJerk-std-X"
[31] | "tBodyGyroJerk-std-Y"
[32] | "tBodyGyroJerk-std-Z"
[33] | "tBodyAccMag-mean"
[34] | "tBodyAccMag-std"
[35] | "tGravityAccMag-mean"
[36] | "tGravityAccMag-std"
[37] | "tBodyAccJerkMag-mean"
[38] | "tBodyAccJerkMag-std"
[39] | "tBodyGyroMag-mean"
[40] | "tBodyGyroMag-std"
[41] | "tBodyGyroJerkMag-mean"
[42] | "tBodyGyroJerkMag-std"
[43] | "fBodyAcc-mean-X"
[44] | "fBodyAcc-mean-Y"
[45] | "fBodyAcc-mean-Z"
[46] | "fBodyAcc-std-X"
[47] | "fBodyAcc-std-Y"
[48] | "fBodyAcc-std-Z"
[49] | "fBodyAcc-meanFreq-X"
[50] | "fBodyAcc-meanFreq-Y"
[51] | "fBodyAcc-meanFreq-Z"
[52] | "fBodyAccJerk-mean-X"
[53] | "fBodyAccJerk-mean-Y"
[54] | "fBodyAccJerk-mean-Z"
[55] | "fBodyAccJerk-std-X"
[56] | "fBodyAccJerk-std-Y"
[57] | "fBodyAccJerk-std-Z"
[58] | "fBodyAccJerk-meanFreq-X"
[59] | "fBodyAccJerk-meanFreq-Y"
[60] | "fBodyAccJerk-meanFreq-Z"
[61] | "fBodyGyro-mean-X"
[62] | "fBodyGyro-mean-Y"
[63] | "fBodyGyro-mean-Z"
[64] | "fBodyGyro-std-X"
[65] | "fBodyGyro-std-Y"
[66] | "fBodyGyro-std-Z"
[67] | "fBodyGyro-meanFreq-X"
[68] | "fBodyGyro-meanFreq-Y"
[69] | "fBodyGyro-meanFreq-Z"
[70] | "fBodyAccMag-mean"
[71] | "fBodyAccMag-std"
[72] | "fBodyAccMag-meanFreq"
[73] | "fBodyBodyAccJerkMag-mean"
[74] | "fBodyBodyAccJerkMag-std"
[75] | "fBodyBodyAccJerkMag-meanFreq"
[76] | "fBodyBodyGyroMag-mean"
[77] | "fBodyBodyGyroMag-std"
[78] | "fBodyBodyGyroMag-meanFreq"
[79] | "fBodyBodyGyroJerkMag-mean"
[80] | "fBodyBodyGyroJerkMag-std"
[81] | "fBodyBodyGyroJerkMag-meanFreq"
[82] | "angle(tBodyAccMean,gravity)"
[83] | "angle(tBodyAccJerkMean,gravityMean)"
[84] | "angle(tBodyGyroMean,gravityMean)"
[85] | "angle(tBodyGyroJerkMean,gravityMean)"
[86] | "angle(X,gravityMean)"
[87] | "angle(Y,gravityMean)"
[88] | "angle(Z,gravityMean)"

###Clean up the data
Some changes were performed to clean up the data. The activity names originally had code numbers (1 to 6) attached to their names. These numbers were omitted from the names, and the names were formatted with first capital letter, underlines were also omitted. For example: the activity name "2 WALKING_UPSTAIRS" replaced with "WalkingUpstairs".
Some minor changes were made to the variables names, omitting only the "()" from their names.

The full description of the workflow to clean up the data and creating the tidy data file **Mean_ActivityDataBySmartphones.txt** by the script [run_analysis.R](https://github.com/anat-kedem/TidyDataActivityRecognitionUsingSmartphones/blob/master/run_analysis.R) is described in the [README.md](https://github.com/anat-kedem/TidyDataActivityRecognitionUsingSmartphones/blob/master/README.md) file.


