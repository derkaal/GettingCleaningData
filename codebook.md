## Getting and cleaning data course project - codebook

#Get data into R
Subject, X and Y datasets are loaded into R for the train and the test data.
The features.txt file provides the header for the X values, which are matched tothe train and the test data.

#Filter and merge data
A filter variable, consisting of the means and standard deviation was created using the headers. This filter was used to extract the means and standard deviation from the test and train data.

Train and test data were then merged using rbind.
Column names "Subject" and "Activity_Label" for the first two columns are added to enhance readibility.

All columns of the data frame were aggregated, grouped by the first two rows ("Subject" and "Activity_Label").

To further enhance readability, an activity name was assigned to the levels in the "Activity_Label" column of the aggregated file.

#Output data
The aggregated file is then written in the working directory.

