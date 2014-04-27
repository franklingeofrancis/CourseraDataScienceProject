CodeBook
========

##Dataset Info

The dataset contains signal information for 30 different people, while they were doing various activities. The signals were obtained from a Samsung Galaxy S.
The various activities were WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING.

The primary signals which were captured are:
* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

For the above signals, other dimensions like mean, std dev, max, min etc. also were captured.

The dataset was divided into two part, training & test. 70% of the data was training and the rest of it was test.

##Processing Steps
1. The first step was to collate both the training and test elements. This involved reading the training set(X_train.txt) and the test set(X_test.txt). Also the
labels for activities for both the training and test sets were read (y_train.txt & y_test.txt). The activity labels was merged back in to the dataset. A similar
process was used to add the subject information as well.

2. The second step was to filter for only the mean() and std() variables. This was done using the grep function in R. A total of 66 variables were obtained.

3. The third & fourth step was to provide descriptive names to the activity. There are currently stored as numbers. After this step, they get coded into more meaningful
values such as Walking, Walking_Upstairs

4. The final step is to create the tidy step. There was an ambiguity in this step which dataset needed to be used. I've chosen to use the dataset with only the mean
and std variables in them. This results in the final tidy dataset having dimensions of 180 X 68 (rows by columns). The final tidy dataset contains average of each variable
(only mean & std) for each activity and each subject.