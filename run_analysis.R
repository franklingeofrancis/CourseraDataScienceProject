setwd("C:/Data Science/Coursera/Data Science Specialization - Coursera/Getting and Cleaning Data/Peer Assessment/")
options(stringsAsFactors=FALSE)

##reading in training data and labels
#training data
trainingdata<-read.table("UCI HAR Dataset/train/X_train.txt", quote="\"",header=FALSE)
#training labels
training_label<-read.table("UCI HAR Dataset/train/y_train.txt",quote="\"",header=FALSE)
#subject info
subject_train<-read.table("UCI HAR Dataset/train/subject_train.txt",quote="\"",header=FALSE)


##reading in test data and labels
#test data
testdata<-read.table("UCI HAR Dataset/test/X_test.txt", quote="\"",header=FALSE)
#test labels
testdata_label<-read.table("UCI HAR Dataset/test/y_test.txt",quote="\"",header=FALSE)
#subject info
subject_test<-read.table("UCI HAR Dataset/test/subject_test.txt",,quote="\"",header=FALSE)

#feature info (headers for the dataset)
features<-read.table("UCI HAR Dataset/features.txt",quote="\"",header=FALSE)
names(features)<-c("Identifier","Labels")

##adding headers to training & test data
names(trainingdata)<-features$Labels
names(testdata)<-features$Labels

names(training_label)<-"ActivityLabel"
names(testdata_label)<-"ActivityLabel"

names(subject_train)<-"Subject"
names(subject_test)<-"Subject"

## 1.Merges the training and the test sets to create one data set
master_training<-cbind(trainingdata,training_label,subject_train)
master_test<-cbind(testdata,testdata_label,subject_test)

masterdata<-rbind(master_training,master_test)


## 2.Extracts only the measurements on the mean and standard deviation 
##   for each measurement

#identifying headers with mean or std in them
mean_std_names<-grep(pattern="mean\\(\\)|std\\(\\)",x=names(masterdata),ignore.case=TRUE,value=TRUE)
#filtering for these headers
masterdata_meanstd_filtered<-masterdata[(mean_std_names)]

## 3.Uses descriptive activity names to name the activities in the data set
## 4.Appropriately labels the data set with descriptive activity names
masterdata_meanstd_filtered$Subject<-masterdata$Subject
masterdata_meanstd_filtered$ActivityLabel<-masterdata$ActivityLabel

activity_labels<-read.table('UCI HAR Dataset/activity_labels.txt')

names(activity_labels)<-c("Identifier","ActivityLabel_Descriptive")

masterdata_filtered_activitydesc<-merge(masterdata_meanstd_filtered,activity_labels,by.x="ActivityLabel",by.y="Identifier")

## 5.Creates a second, independent tidy data set with the average of 
## each variable for each activity and each subject

masterdata_filtered_activitydesc$ActivityLabel<-NULL

#setting the names again (merge created problems)
tidydataset<-aggregate(.~Subject+ActivityLabel_Descriptive,masterdata_filtered_activitydesc,mean)


##outputting the tidied data set
write.table(tidydataset,"tidydataset.txt",row.names=FALSE)
