## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## 
## Keeping invMat as a global variable using <<- assigment (under object scope)
## Also keeping x as a global variable using <<- assigment (under object scope)
## set function sets the variable "x" as the original matrix
## setinv funciton computes inverse of "x" an stores in invMat
# getinv function returns the invMat

makeCacheMatrix <- function(x = matrix()) {
  invMat <- NULL
  set <- function(y) {
    x <<- y
    invMat <<- NULL
  }
  get <- function() x
  setinv <- function() invMat <<- solve(x)
  getinv <- function() invMat
  list(set = set, get = get,
       setinv = setinv,
       getinv = getinv
   )
}


## Write a short comment describing this function
##
## First fetch the inverse using the $getinv() function, it it returns NULL,
## invoke $setinv() function to compute the inverse and cache it
## Else, return the cached value of the inverse
cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  invMat <- x$getinv()
  if(!is.null(invMat)) {
    message("Getting cached inverse")
    return(invMat)
  }
  x$setinv()
  invMat <- x$getinv()
  invMat
}
