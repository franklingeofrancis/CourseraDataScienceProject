setwd("C:/Data Science/Coursera/Data Science Specialization - Coursera/Getting and Cleaning Data/Peer Assessment/")

##reading in training data and labels
#training data
trainingdata<-read.table("UCI HAR Dataset/train/X_train.txt", quote="\"",header=FALSE)
#training labels
training_ylabel<-read.table("UCI HAR Dataset/train/y_train.txt",quote="\"",header=FALSE)

##reading in test data and labels
testdata<-read.table("UCI HAR Dataset/test/X_test.txt", quote="\"",header=FALSE)
