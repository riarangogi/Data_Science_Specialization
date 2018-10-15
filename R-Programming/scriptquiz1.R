datos<-read.csv('hw1_data.csv')
colnames(datos)
datos[c(1,2),]
datos[c(152,153),]
datos[47,1]
ozone<-datos$Ozone
bad<-is.na(ozone)
ozone.na<-ozone[!bad]
length(ozone)-length(ozone.na)
mean(ozone.na)
solar.r.cond<-datos[datos[ ,'Ozone']>31 & datos[ ,'Temp']>90,'Solar.R']
bad2<-is.na(solar.r.cond)
solar.r<-solar.r.cond[!bad2]
mean(solar.r)
temp.cond<-datos[datos[ ,'Month']==6,'Temp']
mean(temp.cond)
ozone.cond<-datos[datos[ ,'Month']==5,'Ozone']
bad3<-is.na(ozone.cond)
ozone.na<-ozone.cond[!bad3]
max(ozone.na)
