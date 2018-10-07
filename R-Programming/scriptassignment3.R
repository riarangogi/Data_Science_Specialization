#Read file and it save in variable outcome
outcome<-read.csv("outcome-of-care-measures.csv",colClasses = 'character')

outcome[,11]<-as.numeric(outcome[,11]) #we convert column 11 in a numeric onject

hist(outcome[,11]) # plot a histogram of outcome[,11]