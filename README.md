# Peer-graded Assignment: Getting and Cleaning Data Course Project
The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set.

The detail of the data can be found [here](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)


This repository contains
* `data_mean_summary.txt`: tidy data with the average of each variable for each activity and each subject
* `run_analysis.R`: the R script used to create the final tidy data
* ``: The code book


## R script: `run_analysis.R`
The R script called run_analysis.R does the following:

1. Read the data and merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement (including tBodyAcc, tGravityAcc and tBodyGyro).
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

To run this R script, please place the unzipped downloaded data folder (`UCI HAR Dataset`) in the root directory.