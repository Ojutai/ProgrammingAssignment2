## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

## Write a short comment describing this function
  get <- function() x
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  
  ## getter/setter for matrix inverse
  getinv <- function() inv
  setinv <- function(inverse) inv <<- inverse
  
  ## return list of functions for matrix
  list(get=get, set=set, getinv=getinv, setinv=setinv)
}
cacheSolve <- function(x, ...) {
  inv <- x$getinv()

# return cached matrix inverse if it's been already computed
  if (!is.null(inv)) {
  message("inverse is cached")
  return(inv)
}

# compute inverse of matrix 
  m <- x$get()
  inv <- solve(m, ...)

# cache inverse
  x$setinv(inv)

# return inverse of matrix
  return(inv)
}