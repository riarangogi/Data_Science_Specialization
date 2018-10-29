library(reshape2)
library(plyr)

##0.Previous

#dir.create('./data') #we create the data folder to save the
#datas from project
#download.file(
#   'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%
#       2FUCI%20HAR%20Dataset.zip',destfile = './data/datas.zip',
            #method = 'curl')#we download the .zip file with the
#datas from final project

list_files_datafolder<-list.files('./data/UCI HAR Dataset')#it are
#all files in data folder from project


##1.Building the data

#we read train datas
subject_train<-read.table(
    './data/UCI HAR Dataset/train/subject_train.txt')
names(subject_train)<-'id'

X_train<-read.table(
    './data/UCI HAR Dataset/train/X_train.txt')
features<-read.table(
    './data/UCI HAR Dataset/features.txt')#table with features
names(X_train)<-features$V2

y_train<-read.table(
    './data/UCI HAR Dataset/train/y_train.txt')
names(y_train)<-'activity'

#we build the train table
table_train<-cbind(subject_train,y_train,X_train)

#we read test datas
subject_test<-read.table(
    './data/UCI HAR Dataset/test/subject_test.txt')
names(subject_test)<-'id'

X_test<-read.table(
    './data/UCI HAR Dataset/test/X_test.txt')
names(X_test)<-features$V2

y_test<-read.table(
    './data/UCI HAR Dataset/test/y_test.txt')
names(y_test)<-'activity'

#we build the test table
table_test<-cbind(subject_test,y_test,X_test)

#we build the data table

data_table<-rbind(table_train,table_test)

data_table<-arrange(data_table,id)#we order the  data_table
#respect to id variable


#2. We extract only the measurements of the mean and
#the standard desviation

#we search in data_table names the measurements of mean and
#standard desviation

mean_std_names<-grepl('mean\\(\\)',names(data_table))|
    grepl('std\\(\\)',names(data_table))

mean_std_names[1:2]<-TRUE#we add the colmns id and activity 
#to mean_std_names vector

data_table<-data_table[,mean_std_names]# we create the data_table
#only with mean y standard desviation

# we convert the activity column from integer to factor
data_table$activity <- factor(data_table$activity, 
    labels=c("Walking","Walking Upstairs", "Walking Downstairs", 
             "Sitting", "Standing", "Laying"))


##3. We write the tidy data

data_table<-melt(data_table,id=c('id','activity'))

tidy_data<-dcast(data_table,id+activity~variable,mean)

write.table(tidy_data,file = './data/tidy data.txt',row.names = FALSE)
