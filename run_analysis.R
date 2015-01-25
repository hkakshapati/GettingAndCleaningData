##1.Merges the training and the test sets to create one data set.

#reading data into R
X_train<-read.table("train/X_train.txt")
X_test<-read.table("test/X_test.txt")
features<-read.table("features.txt")
subject_test<-read.table("test/subject_test.txt")
subject_train<-read.table("train/subject_train.txt")
y_test<-read.table("test/y_test.txt")
y_train<-read.table("train/y_train.txt")
actLabels<-read.table("./activity_labels.txt")

#rbinding rows 
featureDat<-rbind(X_train,X_test)
activityDat<-rbind(y_train,y_test)
subjectDat<-rbind(subject_train,subject_test)
#cbinding columns of features data and activity data to get the complete dataset
dat<-cbind(featureDat,subjectDat,activityDat)

#rename column names of actLabels
names(actLabels)<-c("activity","activityLabels")

#header names of complete dataset
names(dat)<-c(as.character(features[,2]),"subject","activity")
##########################################################################
library(plyr)

##3.Uses descriptive activity names to name the activities in the data set.
#join dat and actLabels for naming activities 
datMerge<-join(dat,actLabels)
##########################################################################

##2.Extracts only the measurements on the mean and standard deviation for each 
#measurement. 
dataSub<-datMerge[,grep("mean|std|subject|activityLabels",names(datMerge))]
##########################################################################

##3.Appropriately labels the data set with descriptive variable names.
#cleaning up column names
cnames<-names(dataSub)
cnames<-gsub("()","",cnames,fixed = TRUE)#remove ()
cnames<-gsub("-","",cnames,fixed = TRUE)#remove -
cnames<-tolower(cnames)#all column names to lower case
names(dataSub)<-cnames
##########################################################################

##5.From the data set in step 4, creates a second, independent tidy data set with the average 
#of each variable for each activity and each subject.
datAvg<-ddply(dataSub,.(subject,activitylabels),numcolwise(mean))

