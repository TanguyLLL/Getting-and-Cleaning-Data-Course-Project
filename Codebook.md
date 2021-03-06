# Getting and Cleaning Data Course Project

## Introduction

* This script first loads all the packages used during the script.
* For those who runs this scripts, please fist check that the following packages are installed on your system : downloader, dplyr and tidyr.
downloader is a package used to download the data from the given url.
dplyr and tydir are used to  clean the datasets and make it tidy.

* The first concrete step is the downloading of the data. The script checks if the zip file is present in the working directory.. If not, it will download it.
* The second step is to load the data in different data sets. The name of the datasets describes their content.
* The next part of the scripts adds lables to the columns of every data set.
* The fourth step extracts only the data concerning the mean and std as requested for the project.
* Next, the script merges the data. first into two data sets : one for the test data and anothe for the train data. Then, it merges those two datasets together into one final/complete dataset. Finally, the scripts changes the numeric values of the activity type into character data (labels provided in the activity_lables.txt)
* The last action is th creat a second tidy dataset called completedata2 answering the last requirement of the project.
It creates a second, independent tidy data set with the average of each variable for each activity and each subject

## Datasets and their Variables

* activLabels : contains the data from the activity_labels.txt file. It links the activity id's with the type of activity. Only Labels are changed to make the data more understandable.
* features : contains the data from the features.txt file. Only Labels are changed to make the data more understandable.
* Xtest : Contains the data from the xtest.txt file. this files contains the data gatherd during the test phase. labels are added and all the variables NOT concerning STD or mean meausres have been removed.
* subjectTest : comes from the subject_test.txt. Gives the id's of the subjects for the test phase. Only labels where changed.
* Ytest : comes from the y_test.txt file. only labels where added. 
* subjectTrain : commes from the subject_train.txt. Gives the id's of the subjects for the train phase. Only labels where changed.
* Xtrain : Contains the data from the xtrain.txt file. this files contains the data gatherd during the train phase. labels are added and all the variables NOT concerning STD or mean meausres have been removed.
* Ytrain : comes from the y_train.txt file. only labels where added. 

ActivityType : Gives the name of the activity                   
SubjectID    : >Gives the ID of the subject
Variables from the original data set :                       
tBodyAcc-mean()-X"               
tBodyAcc-mean()-Y"              
tBodyAcc-mean()-Z"               
tBodyAcc-std()-X"                
tBodyAcc-std()-Y"                
tBodyAcc-std()-Z"               
tGravityAcc-mean()-X"            
tGravityAcc-mean()-Y"            
tGravityAcc-mean()-Z"            
tGravityAcc-std()-X"            
tGravityAcc-std()-Y"             
tGravityAcc-std()-Z"             
tBodyAccJerk-mean()-X"           
tBodyAccJerk-mean()-Y"          
tBodyAccJerk-mean()-Z"           
tBodyAccJerk-std()-X"            
tBodyAccJerk-std()-Y"            
tBodyAccJerk-std()-Z"           
BodyGyro-mean()-X"              
tBodyGyro-mean()-Y"              
tBodyGyro-mean()-Z"              
tBodyGyro-std()-X"              
tBodyGyro-std()-Y"               
tBodyGyro-std()-Z"               
tBodyGyroJerk-mean()-X"          
tBodyGyroJerk-mean()-Y"         
tBodyGyroJerk-mean()-Z"          
tBodyGyroJerk-std()-X"           
tBodyGyroJerk-std()-Y"           
tBodyGyroJerk-std()-Z"          
tBodyAccMag-mean()"              
tBodyAccMag-std()"               
tGravityAccMag-mean()"           
tGravityAccMag-std()"           
tBodyAccJerkMag-mean()"          
tBodyAccJerkMag-std()"           
tBodyGyroMag-mean()"             
tBodyGyroMag-std()"             
tBodyGyroJerkMag-mean()"         
tBodyGyroJerkMag-std()"          
fBodyAcc-mean()-X"               
fBodyAcc-mean()-Y"              
fBodyAcc-mean()-Z"               
fBodyAcc-std()-X"                
fBodyAcc-std()-Y"                
fBodyAcc-std()-Z"               
fBodyAcc-meanFreq()-X"           
fBodyAcc-meanFreq()-Y"           
fBodyAcc-meanFreq()-Z"           
fBodyAccJerk-mean()-X"          
fBodyAccJerk-mean()-Y"           
fBodyAccJerk-mean()-Z"           
fBodyAccJerk-std()-X"            
fBodyAccJerk-std()-Y"           
fBodyAccJerk-std()-Z"            
fBodyAccJerk-meanFreq()-X"       
fBodyAccJerk-meanFreq()-Y"       
fBodyAccJerk-meanFreq()-Z"      
fBodyGyro-mean()-X"              
fBodyGyro-mean()-Y"             
fBodyGyro-mean()-Z"              
fBodyGyro-std()-X"              
fBodyGyro-std()-Y"               
fBodyGyro-std()-Z"               
fBodyGyro-meanFreq()-X"          
fBodyGyro-meanFreq()-Y"         
fBodyGyro-meanFreq()-Z"          
fBodyAccMag-mean()"              
fBodyAccMag-std()"               
fBodyAccMag-meanFreq()"         
fBodyBodyAccJerkMag-mean()"      
fBodyBodyAccJerkMag-std()"       
fBodyBodyAccJerkMag-meanFreq()"  
fBodyBodyGyroMag-mean()"        
fBodyBodyGyroMag-std()"          
fBodyBodyGyroMag-meanFreq()"     
fBodyBodyGyroJerkMag-mean()"     
fBodyBodyGyroJerkMag-std()"     
fBodyBodyGyroJerkMag-meanFreq()"