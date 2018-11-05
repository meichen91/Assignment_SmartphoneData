## Load the library
library(dplyr)
library(data.table)

## Read all data
train_dir = './UCI HAR Dataset/train'
test_dir = './UCI HAR Dataset/test'
y_train = read.table(paste0(train_dir, '/y_train.txt'))
y_test = read.table(paste0(test_dir, '/y_test.txt'))
X_train = read.table(paste0(train_dir, '/X_train.txt'))
X_test = read.table(paste0(test_dir, '/X_test.txt'))
subject_train = read.table(paste0(train_dir, '/subject_train.txt'))
subject_test = read.table(paste0(test_dir, '/subject_test.txt'))

## Merge train and test sets as one
y = rbind(y_train, y_test)
X_full = rbind(X_train, X_test)
subject = rbind(subject_train, subject_test)

## Rename y as meaningful strings
activity_names = c('walking', 'walking_up', 'walking_down', 'sitting', 
                   'standing', 'laying')
activity = c()
for (i in y) {
    activity = append(activity, activity_names[i])
}
activity = factor(activity)

## Extracts only the mean and standard deviation for each measurement.
data = X_full[,c(1:6, 41:46, 121:126)]
X_names = c('tBodyAcc.mean.X', 'tBodyAcc.mean.Y', 'tBodyAcc.mean.Z',
            'tBodyAcc.std.X', 'tBodyAcc.std.Y', 'tBodyAcc.std.Z',
            'tGravityAcc.mean.X', 'tGravityAcc.mean.Y', 'tGravityAcc.mean.Z',
            'tGravityAcc.std.X', 'tGravityAcc.std.Y', 'tGravityAcc.std.Z',
            'tBodyGyro.mean.X', 'tBodyGyro.mean.Y', 'tBodyGyro.mean.Z',
            'tBodyGyro.std.X', 'tBodyGyro.std.Y', 'tBodyGyro.std.Z')
data <- setNames(X, X_names)

## Add columns representing activity and subject
data$activity = activity
data$subject = subject$V1

## Creates a tidy data set with the average of each variable for 
## each activity and each subject.
data_mean_summary <- data %>%
    melt(id = c('activity', 'subject'), measure.vars = X_names, 
         variable.name = 'variable') %>%
    group_by(activity, subject, variable) %>%
    summarise(mean_variable = mean(value))

## Write data to txt file
write.table(data_mean_summary, file = "data_mean_summary.txt", 
            row.names = FALSE, quote = FALSE)