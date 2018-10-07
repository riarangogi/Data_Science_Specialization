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