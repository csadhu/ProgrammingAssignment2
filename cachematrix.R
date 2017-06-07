## Week 3 Coursera R Programming Assignment 2

## Add comments here that give an overall description of what your functions do

## Write a short comment describing this function.

## This function creates a special "matrix object", "makeCacheMatrix"  that can cache its
## inverse.

## It is really a list containing a function to  
## set the value of the matrix
## get the value of the matrix
## set the value of its inverse
## get the value of its inverse

##Computing the inverse of a square matrix can be done with the solve function in R.
## If X is a square invertible matrix, then solve(X) returns its inverse.

makeCacheMatrix <- function(x = matrix()) {

## initialize inv as NULL; holds the value of the inverse matrix
  
    inv <-NULL               

## define the set function to assign new  value of matrix in parent environment                        
    set <-function(y){      
    x <<- y
## if there is a new matrix, reset inv to NULL          
    inv <<- NULL     
    }

## define the get function - returns the value of the matrix argument assign value of inv in parent environment
    
    get <-function() x      
+   setInverse <- function(solve) inv <<- solve 
                            
    ## get the value of inv where called
    
    getInverse <- function() inv
    list(set = set, get = get,
         setInverse = setInverse,
         getInverse = getInverse)
}

## Write a short comment describing this function
## get the value of inv where called to refer to the functions with $ operator
 
cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
  
  inv <- x$getInverse()
  if (!is.null(inv))
      message("getting cached data")
      return(inv)

  data <- x$get()
  inv <-solve(data, ...)
  x$setInverse(inv)
  inv
}

