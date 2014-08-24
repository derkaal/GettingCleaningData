## Getting and cleaning data course project

This repository includes the R script "run_Analysis.R" and the complementary codebook.

The purpose of the script is to take a data set* and:

1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement. 
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive variable names. 
5. Create a second, independent tidy data set with the average of each variable for each activity and each subject. 

*The data set is available at: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

#Prerequisite
The data set is unzipped into the current working directory.
The package "reshape2" is installed.