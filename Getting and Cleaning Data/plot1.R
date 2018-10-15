data<-read.table('./data/household_power_consumption.txt'
                 ,header = TRUE,sep = ';',na.strings = '?'
                 ,dec = '.',stringsAsFactors=FALSE)
#We read the file to work, the NA values are represented
#with ?

#We clean the Global_active_power variable from NA values
data <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
GAP<-data$Global_active_power
GAP<-as.numeric(GAP)

#We make the plot
png(file='plot1.png',width = 480,height = 480)
hist(GAP,col = 'red',xlab = 'Global Active Power (kilowatts)'
     ,main = 'Global Active Power')
dev.off()
