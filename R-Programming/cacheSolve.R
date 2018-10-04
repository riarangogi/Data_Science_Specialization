#This function computes the inverse of the special "matrix" returned by 
#makeCacheMatrix above


cacheSolve <- function(x) {#the parameter x is a matrix created with makeCacheMatrix
    
    m <- x$getInverse() #the value in cache for the inverse
    
    if(!is.null(m)) { #If the cache was not empty, we can just return it
        message("getting cached data")
        return(m)
    }
    
    data <- x$get()  # Get value of matrix
    
    m <- solve(data) # Calculate inverse
    
    x$setInverse(m)  # Cache the result
    
    m#this function return the inverse
}