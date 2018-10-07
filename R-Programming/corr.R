#This function calculate the correlation betwen nitrate and sulfate  to
#files with nlumber of completely cases greaster than thrshould
corr<-function(directory, threshold=0){
    list_names<-list.files(directory)
    setwd(directory)
    vec.cor<-c()
    for(i in 1:332){
        file.df<-read.csv(list_names[i])
        good<-complete.cases(file.df)
        file.df<-file.df[good,]# This is data frame without na values
        n<-nrow(file.df)# number of completely cases
        if(n>threshold){
            vec.cor[i]<-cor(file.df$sulfate,file.df$nitrate)
        }
    }
    bad<-is.na(vec.cor)
    vec.cor<- vec.cor[!bad] # This is a vec.cor without na values
    vec.cor
} 