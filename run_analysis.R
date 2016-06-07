library(plyr)
#Step 1
features<-read.table("UCI HAR Dataset/features.txt",colClasses = c("character"))
activity<-read.table("UCI HAR Dataset/activity_labels.txt",col.names=c("ActivityId", "Activity"))
xtrain<-read.table("UCI HAR Dataset/train/X_train.txt")
ytrain<-read.table("UCI HAR Dataset/train/y_train.txt")
subjecttrain<-read.table("UCI HAR Dataset/train/subject_train.txt")
xtest<-read.table("UCI HAR Dataset/test/X_test.txt")
ytest<-read.table("UCI HAR Dataset/test/y_test.txt")
subjecttest<-read.table("UCI HAR Dataset/test/subject_test.txt")
train<-cbind(cbind(xtrain, subjecttrain), ytrain)
test<-cbind(cbind(xtest,subjecttest),ytest)
data<-rbind(train,test)
labels<-rbind(rbind(features,c(562,"Subject")),c(563,"ActivityId"))[,2]
names(data)<-labels

#Step 2
datameanstd<-data[,grepl("mean|std|Subject|ActivityId", names(data))]


#Step 3
datameanstd<-join(datameanstd,activity,by="ActivityId", match="first")
datameanstd<-datameanstd[,-1]

#Step 4
names(datameanstd)<-gsub('\\(|\\)',"",names(datameanstd))
names(datameanstd)<-gsub('Acc',"Acceleration",names(datameanstd))
names(datameanstd)<-gsub('GyroJerk',"AngularAcceleration",names(datameanstd))
names(datameanstd)<-gsub('Gyro',"AngularSpeed",names(datameanstd))
names(datameanstd)<-gsub('Mag',"Magnitude",names(datameanstd))
names(datameanstd)<-gsub('^t',"TimeDomain.",names(datameanstd))
names(datameanstd)<-gsub('^f',"FrequencyDomain.",names(datameanstd))
names(datameanstd)<-gsub('\\.mean',".Mean",names(datameanstd))
names(datameanstd)<-gsub('\\.std',".StandardDeviation",names(datameanstd))
names(datameanstd)<-gsub('Freq\\.',"Frequency.",names(datameanstd))
names(datameanstd)<-gsub('Freq$',"Frequency",names(datameanstd))

#Step 5
avgbyactsub<-ddply(datameanstd,c("Subject","Activity"),numcolwise(mean))
write.table(avgbyactsub,file="tidy_data.txt",row.names=FALSE)