#Function to calculate the mean of the pollutants
pollutantmean<-function(directory,pollutant,id=1:332){
    list_names <-list.files(directory)# Character vector with the names of all 
    #files in the directory.
    setwd(directory)
    mean.total<-0
    length.col.pollutant<-c()
    
    for(i in id){
        file.df<-read.csv(list_names[i],header = TRUE) #data frame of the i-file
        col.pollutant<-file.df[[pollutant]]
        bad<- is.na(col.pollutant)
        col.pollutant<-col.pollutant[!bad] # this is the vector col.pollutant without
        #na values
        n<-length(col.pollutant)
        length.col.pollutant[i]<-length(col.pollutant) # this vector contain the 
        #length of vectors col.pollutant witholut na values 
        mean.file<-mean(col.pollutant)
        mean.total<-mean.total  + n*mean.file 
    }
    bad<-is.na(length.col.pollutant)
    length.col.pollutant<-length.col.pollutant[!bad] # this is the vector 
    #length.col.pollutant without na values
    mean<-mean.total/sum(length.col.pollutant)
    mean  
}
