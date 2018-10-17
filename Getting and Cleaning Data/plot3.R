##We read  the file
data<-read.table('./data/household_power_consumption.txt'
                 ,sep = ';',dec = '.',na.strings = '?'
                 ,stringsAsFactors = FALSE,header = TRUE)


##We clean the data
data<-data[data$Date %in% c("1/2/2007","2/2/2007"),]#we work with
#the datas only betwen c("1/2/2007","2/2/2007") date
date_time<-strptime(
    paste(data$Date,data$Time,' '),"%d/%m/%Y %H:%M:%S")#we merge
#the Data and Time variables and we configure the new variable with
#strptime
SM1<-as.numeric(data$Sub_metering_1)
SM2<-as.numeric(data$Sub_metering_2)
SM3<-as.numeric(data$Sub_metering_3)

##We create the plot
png(file='plot3.png',width = 480,height = 480)
plot(date_time,SM1,xlab = '',ylab = 'Energy sub metering',type = 'l')
lines(date_time,SM2,type = 'l',col='red')
lines(date_time,SM3,type = 'l',col='blue')
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
       , lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()