library(data.table)


## We read the data files
data.1999<-read.table('./Data/RD_501_88101_1999-0.txt',
                      sep = '|',comment.char = '#',
                      header = FALSE,na.strings = '')
data.2012<-read.table('./Data/RD_501_88101_2012-0.txt',
                      sep = '|',comment.char = '#',
                      header = FALSE,na.strings = '')
# the first lines from files are comments about the tables
col.names<-readLines('./Data/RD_501_88101_1999-0.txt',1)
#we clean the col.names variable
col.names<-strsplit(col.names,'|',fixed = TRUE)
names(data.1999)<-make.names(col.names[[1]])
names(data.2012)<-make.names(col.names[[1]])


## The missing values
mv.1999<-data.1999$Sample.Value
mv.2012<-data.2012$Sample.Value
par(mfrow=c(1,2))
boxplot(log10(mv.1999),xlab='1999')
boxplot(log10(mv.2012),xlab='2012')
# we note that not have negative values, only very small values.
negative.1999<-mv.1999<0
negative.2012<-mv.2012<0
sum(negative.1999,na.rm = TRUE)
sum(negative.2012,na.rm = TRUE)
#the sum of negative number  never is a positive number
dates<-data.2012$Date
dates<-as.Date(as.character(dates),'%Y%m%d')
par(mfrow=c(1,1))
hist(dates[negative.2012],'month')


## We crea a new data tables
data.1999$County.site<-with(data.1999,
                            paste(County.Code,Site.ID,sep = '.'))
data.2012$County.site<-with(data.2012,
                            paste(County.Code,Site.ID,sep = '.'))
data.1999sub<-subset(data.1999,
                     State.Code==36&County.Code==63&Site.ID==2008)
data.2012sub<-subset(data.2012,
                     State.Code==36&County.Code==63&Site.ID==2008)
#we creat the subsets with the specific conditions
dates.sub<-data.2012sub$Date
dates.sub<-as.Date(as.character(dates.sub),'%Y%m%d')
plot(dates.sub,data.2012sub$Sample.Value)
