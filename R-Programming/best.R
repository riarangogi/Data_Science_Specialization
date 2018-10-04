#Their function read the outcome-of-care-measures.csv file and returns a 
#character vector with the name of the hospital that has the best (i.e. lowest)
#30-day mortality for the specified outcome in that state. 
best<-function(state,outcome){
    
    df<-read.csv('outcome-of-care-measures.csv',colClasses = 'character')
    
    #get the outcome column from the data file
    if (outcome == "heart attack") {
        outcome <- 11
    }
    else if (outcome == "heart failure") {
        outcome <- 17
    } 
    else if (outcome == "pneumonia"){
        outcome <- 23
    }
    else {
        stop(print("invalid outcome"))
    }
    if ((state %in% df$states) == FALSE) {
        stop(print("invalid state"))
    }
    
    #we select of agreegment the state variable
    df<-subset(df,df$states==state)
    
    #The data frame without na values of agreegment to outcome column
    col.outcome<-as.numeric(df[,outcome])
    bad<-is.na(col.outcome)
    df<-df[!bad,]
    
    #find the hospitals in the rows with the minimum outcome value
    col.outcome<-as.numeric(df[,outcome])
    row.outcome<-which(col.outcome==min(col.outcome))
    name.hosp<-df[row.outcome,2]
    
    #if there are multiple hospitals with the minimum outcome value, then
    #return the first hospital name from the alphabetically sorted hospital
    #names list
    if (length(name.hosp) > 1) {
        name.hosp <- sort(name.hosp)
        name.hosp[1]
    }
    else {
        name.hosp
    }
}
