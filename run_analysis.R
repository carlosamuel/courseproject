##Coursera DataScience Specioalization - Getting And Cleaning Data
##Course Project

##R-Code for reading some data, naming it according criteria, subsetting only data containing means or Std.deviations and generating a new tidy file

##Reading test data
test_subject<-read.table("test\\subject_test.txt")
test_x<-read.table("test\\X_test.txt")
test_activity<-read.table("test\\y_test.txt")


##Reading train data
train_subject<-read.table("train\\subject_train.txt")
train_x<-read.table("train\\X_train.txt")
train_activity<-read.table("train\\y_train.txt")

##Reading variables names
variables_names<-read.table("features.txt")


##assigning names to the test data
names(test_x)<-variables_names$V2
names(test_subject)<-c("subject_id")
names(test_activity)<-c("activity")


##assigning names to the train data
names(train_x)<-variables_names$V2
names(train_subject)<-c("subject_id")
names(train_activity)<-c("activity")


##merging data into one single data frame
test_data<-cbind(test_subject,test_activity,test_x)
train_data<-cbind(train_subject,train_activity,train_x)
merged_data<-rbind(test_data,train_data)

##subsetting the variables names that refer to a mean or a std.dev. by using regex
variables<-variables_names$V2[grep("mean\\(\\)|std\\(\\)",variables_names$V2)]

##subsetting the variables form the merged data frame
variablestexto<-c(as.character(variables))
real_data<-merged_data[,c("subject_id","activity",variablestexto)]

##changing numeric activity data to text data
for (i in 1:nrow(real_data)) {
		if(real_data[i,2]==1){
			real_data[i,2]<-"Walking"
		} else if(real_data[i,2]==2) {
			real_data[i,2]<-"Walking_upstairs"
		} else if(real_data[i,2]==3) {
			real_data[i,2]<-"Walking_downstairs"
		} else if(real_data[i,2]==4) {
			real_data[i,2]<-"Sitting"
		} else if(real_data[i,2]==5) {			
			real_data[i,2]<-"Standing"
		} else if(real_data[i,2]==6) {
			real_data[i,2]<-"Laying"
		}
}

##grouping by subject and ativity
tidy_data_set<-aggregate(. ~subject_id + activity, real_data, mean)

##generating txt output file
write.table(tidy_data_set,"tidydataset.txt",row.name=FALSE)



