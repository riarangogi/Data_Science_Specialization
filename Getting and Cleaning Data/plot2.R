##We read the datas in data variable
data<-read.table(file = './data/household_power_consumption.txt'
                 ,header = TRUE,sep = ';',dec = '.'
                 ,na.strings = '?',stringsAsFactors = FALSE)


##we clean the datas
data<-data[data$Date %in% c("1/2/2007","2/2/2007"),]#we work with
#the datas only betwen c("1/2/2007","2/2/2007") date
date_time<-strptime(
    paste(data$Date,data$Time,sep = ' '),"%d/%m/%Y %H:%M:%S")#we merge
#the Data and Time variables and we configure the new variable with
#strptime
GAP<-as.numeric(data$Global_active_power)


##We create the plot
png('plot2.png',width = 480,height = 480)
plot(date_time,GAP,xlab = '', ylab="Global Active Power (kilowatts)"
     ,type ="l")
dev.off()