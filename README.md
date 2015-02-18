#Workflow for Creating the Tidy Data "Mean_ActivityDataBySmartphones.txt"
Following is the description of all transformation and cleaning up that were made to the original source data, to create the tidy data. To read the description of the tidy data itself as well as references to the original source data, see the [Code Book](https://github.com/anat-kedem/TidyDataActivityRecognitionUsingSmartphones/blob/master/CodeBook.md).

All manipulations on the data, as described below, were executed using one R script called [run_analysis.R](https://github.com/anat-kedem/TidyDataActivityRecognitionUsingSmartphones/blob/master/run_analysis.R). The following describes how the script works.

##1. Read the original files

The original files include data files, variables and observation names files and descriptive files, as listed below.

###Files:
Main folder: "UCI HAR Dataset".

Files under the main folder:
- "README.txt"
- "features_info.txt" 
>Variables description

- "features.txt" 
>Names of 561 variables

- "activity_labels.txt"
>Names of the 6 activities that were measured for each subject

Files under subfolder "train":
- "X_train.txt"
>Data for train group (21 subjects), 561 columns, 7352 observations

- "subject_train.txt"
>The subject code for each observation (7352 rows, 1 column)

- "y_train.txt"
>The activity code for each observation (7352 rows, 1 column)

Files under subfolder "test":
- "X_test.txt"
>Data for test group (9 subjects), 561 columns, 2947 observations

- "subject_test.txt"
>The subject code for each observation (2947 rows, 1 column)

- "y_train.txt"
>The activity code for each observation (2947 rows, 1 column)

###Script steps:
1. Read eight files into eight data frames.
>Three files from each subfolder were read, and two files from the main folder. Total 8 data frames were created:

File Name  | Data Frame Name
:----- | :--------
subject_train.txt | train.subject
Y_train.txt | train.activity
X_train.txt | train.data
subject_test.txt | test.subject
Y_test.txt | test.activity
X_test.txt | test.data
features.txt | features.names
activity_labels.txt | activity.names

##2. Build two separate tables for training and test sets
###Script steps:
1. Each table was built from the "data" (using train.data or test.data), 
2. A subject column was added as the first column from the subject data frame (using train.subject or test.subject),
3. An activity column was added as the second column from the activity data frame (using train.activity or test.activity)
4. Column names were added from the variable data frame (using features.names).

##3. Merge into one large data set
###Script steps:
1. The two separate tables were merged into one data set where the first 7352 rows are the train data and the following 2947 rows are the test data.
>The merged table included the original 561 columns and two more columns for subject code and activity code.

##4. Create filtered table with mean & std variables only
###Script steps:
1. From the merged table, only the measurements on the mean and standard deviation for each measurement were extracted to create a new smaller (filtered) table. 
>All columns that their name contained the word "mean" or "std" (non case sensitive) were included in the filtered table.
2. In the filtered table, the activity codes were replaces with descriptive names. 
>The activity names were taken from the data frame activity.names based on the code number of each activity. Some editing was done to omit underlines and to format the names with first capital letter.
3. Some minor editing was done for the variable names by omitting the "()".

##5. Create the tidy data set
An independent tidy data set table was then created from the filtered data. The tidy data set contains the average of each variable for each activity for each subject.
###Script steps:
1. A table was built with the proper dimensions.
>The first column contains the subject codes, the second column contains the six activity names (for each subject). Another 86 columns are the relevant variables (mean or std). The table contains 180 rows (30 subjects x 6 activities).
2. The table was then filled with the means for each variable, for each activity, for each subject, based on the values in the filtered table. (NAs were omitted from the calculation).

##6. Write the tidy data set to a text file
###Script steps:
1. The tidy data set table was written to a text file named "Mean_ActivityDataBySmartphones.txt", in the main working directory.

To read this file from the working directory use the following in R:
```R
MeanData <- read.table(file="Mean_ActivityDataBySmartphones.txt", colClasses=c("character", "character",rep("numeric",86)), header=TRUE)
```
