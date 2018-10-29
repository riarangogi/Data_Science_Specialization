## 1. We read the csv file
data<-read.csv('./data/_e143dff6e844c7af8da2a4e71d7c054d_payments.csv')

str(data)

head(data,n=3)


## 2. We select and configures the datas to working
dataNY<-subset(data,Provider.City=='NEW YORK')#the datas only new york city


## 3. We make plot with ggplot2 package
library(ggplot2)

pdf('plot1.pdf')
ggplot(dataNY,aes(x=Average.Covered.Charges,
                           y=Average.Total.Payments)) + 
                            geom_point(colour="#D55E00") +
                geom_smooth(method = 'lm') + labs(x='Mean covered charges',
                                   y='Mean total payments',
title='Relationship bewteen mean covered charges and mean total payments
 from New York city')
dev.off()

pdf('plot2.pdf')
ggplot(data,aes(x=Average.Covered.Charges,
                  y=Average.Total.Payments)) + 
    facet_wrap(~DRG.Definition,nrow = 3,ncol = 2)+
    geom_point(aes(color=Provider.State)) +
    geom_smooth() + labs(x='Mean covered charges',
                                      y='Mean total payments',
                                      title='Relationship bewteen mean covered charges and mean total payments
 vary medical contidion and the state in which care was received')
dev.off()