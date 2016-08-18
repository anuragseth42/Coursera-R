## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## 
## Keeping invMat as a global variable using <<- assigment (under object scope)
## set function sets the variable "x" as the original matrix
## setinv funciton sets the inverse
## getinv function returns the invMat

makeCacheMatrix <- function(x = matrix()){
    invMat <- NULL
    set <- function(y) {
        x <<- y
        invMat <<- NULL
    }
    get <- function() x
    setInv <- function(solve) invMat<<- solve
    getInv <- function() invMat
    list(set = set, get = get,
         setInv = setInv,
         getInv = getInv)
}


## Write a short comment describing this function
##
## First fetch the inverse using the $getinv() function, it it returns NULL,
## invoke $setinv() function to compute the inverse and cache it
## Else, return the cached value of the inverse

cacheSolve <- function(x, ...){
    invMat <- x$getInv()
    if(!is.null(invMat)){
        message("Getting cached data inverse")
        return(invMat)
    }
    mt <- x$get()
    invMat <- solve(mt,...)
    x$setInv(invMat)
    invMat
}
