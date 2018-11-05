The file `data_mean_summary.txt`  is the tidy data with the average of each variable for each activity and each subject.

There are 4 fields: 

|Field name| Data Type | Description |
|--|--| --|
|activity  | string | one of the 6 activities ('walking', 'walking_up', 'walking_down', 'sitting','standing', 'laying')  |
|subject| integer | a number (1 to 30) that identifies the subject who performed the activity |
|variable| string | describing which variable; 18 different variables in total, mean and std of 3 types of measurements in 3 different directions (X, Y, and Z)|
|mean_variable| float | the average of each variable for each activity and each subject |

Total number of rows: 3240 (6 activities * 30 subjects * 18 variables)

To read the data in R: `data = read.table('data_mean_summary.txt', header = TRUE)`