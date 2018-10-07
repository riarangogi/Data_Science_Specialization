#This function calculate the number of completely observed cases
complete<-function(directory,id=1:332){
    list_names <-list.files(directory)# Character vector with the names of all 
    #files in the directory.
    setwd(directory)
    number_id<-c()
    number_completely.cases<-c()
    for(i in id){
        file.df<-read.csv(list_names[i],header = TRUE)
        good<-complete.cases(file.df)
        file.df<-file.df[good,] # this is the data frame from file without
        #na values
        number_id[i]<-i
        number_completely.cases[i]<- nrow(file.df)
    }
    bad<-is.na(number_completely.cases)
    number_completely.cases<-number_completely.cases[!bad]
    bad<-is.na(number_id)
    number_id<-number_id[!bad]
    df<-data.frame(id = number_id,nobs = number_completely.cases)
    df
}