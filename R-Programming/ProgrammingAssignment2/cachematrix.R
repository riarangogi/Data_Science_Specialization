# Create a special "matrix" object that can cache its inverse.

makeCacheMatrix <- function(x = matrix()) {#the parameter x is a matrix
    m <- NULL
    
    set <- function(y) {# Define function to set the value of the matrix
        x <<- y    # Set the value of the matrix
        m <<- NULL # Clear the cache
    }
    
    get <- function() x# Define function to get the value of the matrix
    
    setInverse <- function(inverse) m <<- inverse#Define function to set the inverse
    
    getInverse <- function() m# Define function to get the inverse
    
    #this function return a list with the above four functions
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}

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