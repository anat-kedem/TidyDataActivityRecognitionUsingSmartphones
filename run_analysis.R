run_analysis <- function() {
##---------------------------- instructions --------------------------------------
##You should create one R script called run_analysis.R that does the following. 
##1. Merges the training and the test sets to create one data set.
##2. Extracts only the measurements on the mean and standard deviation for each measurement
##3. Uses descriptive activity names to name the activities in the data set
##4. Appropriately labels the data set with descriptive variable names. 
##5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
##--------------------------------------------------------------------------------

        ##read data from working directory: originally some of the data is in sub-directories "test" and "train"
        train.activity <- read.table("./train/y_train.txt", colClasses = "character")
        test.activity <- read.table("./test/y_test.txt", colClasses = "character")
        
        train.subject <- read.table("./train/subject_train.txt", colClasses = "character")
        test.subject <- read.table("./test/subject_test.txt", colClasses = "character")
        
        train.data <- read.table("./train/X_train.txt")
        test.data <- read.table("./test/X_test.txt")
        
        features.names <- read.table("features.txt", colClasses = "character")
        activity.names <- read.table("activity_labels.txt", colClasses = "character")
        
        ##set column names and build one dataset that contain both test and train data
        ##1. build train dataset
        colnames(train.data) <- features.names[,2] ##add the "features" as column names
        colnames(train.activity) <- "activityName" ##add a column name for the activitiy column
        colnames(train.subject) <- "subject" ##add a column name for the subject column
        train <- cbind(train.subject, train.activity, train.data, deparse.level = 0) ##create data frame: column one is subject number, column two is activity number, other columns are the results data
        
        ##2. build test dataset
        colnames(test.data) <- features.names[,2] ##add the features as column names
        colnames(test.activity) <- "activityName" ##add a column name for the activitiy column
        colnames(test.subject) <- "subject" ##add a column name for the subject column
        test <- cbind(test.subject, test.activity, test.data, deparse.level = 0) ##create data frame: column one is subject number, column two is activity number, other columns are the results data
        
        ##3. merge into one dataset, and sort it
        largeDataset <- rbind(train, test) ##add rows of train set and rows of test set, into new data frame
        largeDataset <- largeDataset[order(largeDataset$subject,largeDataset$activityName),] ##sort the data frame
        
        
        ##create smaller dataset that contain data for mean and std (and the subject and activity)
        ##1. filter the large dataset into smaller dataset
        colMeanStd <- grepl("[Mm]ean|std",names(largeDataset)) ##logical vector indicating which of the columns contain  one of the words: mean, Mean, or std
        colMeanStd[1] <- TRUE ##update the first cell in the logical vector to keep also column "subject"
        colMeanStd[2] <- TRUE ##update the second cell in the logical vector to keep also column "activity"
        smallDataset <- largeDataset[,colMeanStd] ##create the filtered data set using the logical vector
        
        ##2. edit activity names to descriptive names, remove some brackets from the variable names
        edited.activity.names <- activity.names
        edited.activity.names[,2] <- sub("WALKING", "Walking" ,edited.activity.names[,2])
        edited.activity.names[,2] <- sub("_UPSTAIRS", "Upstairs" ,edited.activity.names[,2])
        edited.activity.names[,2] <- sub("_DOWNSTAIRS", "Downstairs" ,edited.activity.names[,2])
        edited.activity.names[,2] <- sub("SITTING", "Sitting" ,edited.activity.names[,2])
        edited.activity.names[,2] <- sub("STANDING", "Standing" ,edited.activity.names[,2])
        edited.activity.names[,2] <- sub("LAYING", "Laying" ,edited.activity.names[,2])
        
        for(i in activity.names[,1]) {
                smallDataset$activityName <- sub(i, edited.activity.names[as.numeric(i),2], smallDataset$activityName)
        }
        names(smallDataset) <- sub("[(][)]", "", names(smallDataset))
        names(smallDataset)[83] <- sub("[)]", "", names(smallDataset)[83])
        
        ##create the summary dataset: for each subject there is a mean for each activity and one mean for all activities
        ##1. build data frame to store the means
        subjectList <- unique(smallDataset$subject) ##basically, 1 to 30
        subjectNum <- length(subjectList) ##how many subjects (30)
        activityList <- unique(smallDataset$activityName) ##six activity names
        activityNum <- length(activityList) ##how many activities (6)
        variableNum <- ncol(smallDataset)
        meanDataset <- data.frame(
                Subject=unlist(lapply(c("1":"30"), function(x) {rep(x, activityNum)})), ##for each subject 6 rows of activities
                Activities=rep(c(activityList), subjectNum)
        )
        emptyMean <- data.frame(matrix(ncol = (ncol(smallDataset)-2), nrow = nrow(meanDataset))) ##create matrix with empty (NA) columns to store all variable means
        colnames(emptyMean) <- colnames(smallDataset[3:ncol(smallDataset)]) ##names for the empty columns
        meanDataset <- cbind(meanDataset, emptyMean, deparse.level = 0) ##data frame is ready to store mean values
        
        ##2. fill data frame with of means of variables
        for(i in 1:180) {  ##pass through each row
                for(j in 3:88) {  ##pass through each column
                        meanDataset[i,j] <- with(smallDataset, mean(smallDataset[,j][subject==meanDataset[i,1] & activityName==meanDataset[i,2]], na.rm=TRUE))
                }
        }
        
        
        ##write the tidy data to a file
        write.table(meanDataset, file="Mean_ActivityDataBySmartphones.txt", row.names=FALSE)

##to read this file use the following:
##MeanData <- read.table(file="Mean_ActivityDataBySmartphones.txt", colClasses=c("character", "character",rep("numeric",86)), header=TRUE)
}
