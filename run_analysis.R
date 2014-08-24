## Create one R script called run_analysis.R that does the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement.
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive activity names.
## 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

setwd("UCI HAR Dataset")
library(reshape2)

##read data
#train data
subject_train <- read.table("train/subject_train.txt")
X_train <- read.table("train/X_train.txt")
Y_train <- read.table("train/y_train.txt")

#test data
subject_test <- read.table("test/subject_test.txt")
X_test <- read.table("test/X_test.txt")
Y_test <- read.table("test/y_test.txt")

#features
features <- read.table("features.txt")

#activity names
activity_labels <- read.table("activity_labels.txt")

#extract name columns of features 
names(X_test) <- features[,2]
names(X_train) <- features[,2]

#create filter variable with mean and std dev
mean_and_std <- grep(".*Mean.*|.*Std.*", features[,2])

#filter mean and std dev on test and train
X_test_mean_and_std <- X_test[,mean_and_std]
X_train_mean_and_std <- X_train[,mean_and_std]

#merge test and train data
subject_all <- rbind(subject_test, subject_train)
X_all <- rbind(X_test_mean_and_std, X_train_mean_and_std)
Y_all <- rbind(Y_test, Y_train)

#merge to one data.frame
merged <- cbind(subject_all, Y_all, X_all)

names(merged)[1] <- "Subject"
names(merged)[2] <- "Activity_Label"

#aggregate by subjectid and activity
tidy <- aggregate(. ~ Subject + Activity_Label, data=merged, FUN = mean)

#apply descriptive activity names
tidy$Activity_Label <- factor(tidy$Activity_Label, labels=activity_labels[,2])

#write txt file
write.table(tidy, file="./tidy.txt", sep="\t", row.names=FALSE)