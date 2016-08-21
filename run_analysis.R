# This is my submission for the getting and cleaning data course project. i haven't followed the same order (5 points) as the instructions but hope
# that my comments will allow you to understand everything clearly.
# my script uses the downloader package in order to download the zip file. I will also use dplyr and tidyr packages to work on the data.
#please make sure that those packages are installed on you computer.
# This first part checks if a file called "getdata_dataset.zip" exists. If not, it will download the course dataset and extract it.
# !!! I used the downloader package to download the data. Please make sure you have this package installed. I believe dplyr  and tidyr package wont be a problem.

library(downloader)
library(dplyr)
library(tidyr)

filename <- "getdata_dataset.zip"
url<- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

if(!file.exists(filename)){ download(url, filename, mode = "wb"); 
        unzip(filename)
                                     
}

# read every needed doc from the test files and put the data in a R dataset.
# This answers: 3) Uses descriptive activity names to name the activities in the data set

Xtest<-read.table("UCI HAR Dataset/test/X_test.txt", header = FALSE)
subjectTest<-read.table("UCI HAR Dataset/test/subject_test.txt", header = FALSE)
Ytest<-read.table("UCI HAR Dataset/test/y_test.txt", header = FALSE)
# read every needed doc from the train files and put the data in a R dataset.

subjectTrain <- read.table("UCI HAR Dataset/train/subject_train.txt",header=FALSE)
Xtrain<- read.table("UCI HAR Dataset/train/X_train.txt",header=FALSE)
Ytrain<- read.table("UCI HAR Dataset/train/y_train.txt",header=FALSE)

# read activity labels + features doc and put it in a R database.
activLabels <- read.table("UCI HAR Dataset/activity_labels.txt", header = FALSE)
features <- read.table("UCI HAR Dataset/features.txt", header = FALSE)

# This is the part where I give more understandable colon names to all those data sets.
# This answers: Appropriately labels the data set with descriptive variable names.


colnames(activLabels) <- c("activityID", "activityType" )
colnames(Xtest) <- features[,2]
colnames(Ytest) <- "ActivityType"
colnames(subjectTest) <- "SubjectID"

colnames(Xtrain) <- features[,2]
colnames(Ytrain) <- "ActivityType"
colnames(subjectTrain) <- "SubjectID"

# This part selects only the vatiables concerning the mean and the std in Xtest and Xtrain datasets.
# This answers: 2)Extracts only the measurements on the mean and standard deviation for each measurement.

Xtest<- Xtest[,grep("mean|std", features[,2])]
Xtrain <- Xtrain[,grep("mean|std", features[,2])]

# I merge the data into two data sets. One "Test set" and another "Train set". Both datasets now contains the "mean" and "std" 
#data + activity type and subject id

testData <- cbind(Ytest,subjectTest,Xtest)
trainData <- cbind(Ytrain,subjectTrain,Xtrain)

# Here i merge testData and trainData in a final complete dataset
# I also replace the numeric activity type with proper activity labels.
#This answers : 1) Merges the training and the test sets to create one data set.

completeData<- bind_rows(testData,trainData)
completeData$ActivityType<- factor(completeData$ActivityType, levels = activLabels[,1], labels = activLabels[,2])

# ANd last : my second tidy data set with the average of every variable by activity and subjet.
#Answers to : 5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
completeData2<- tbl_df(completeData)
completeData2<-group_by(completeData, ActivityType,SubjectID) 
completeData2<- summarise_all(completeData2,mean)






