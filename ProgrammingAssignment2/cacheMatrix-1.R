# cacheMatrix-1.R
# Version 0.0.1-alpha
# Created 19-May-2016
# Last updated 19-May-2016

# This is an alternative version of my submission of the second programming
# assignment for the Coursesa R Programming course.  This version goes beyond
# the basic requirements for the course by adding additional error-checking
# routines, and drawing in ideas from other parts of the course materials.

# This version was partially founded on my attempt to understand what the
# course-provided example, cachmean.R was doing, and partially from my
# interest in finding a simpler way of solving the same problem.  This script
# is still under development and is NOT my official submission, for that see
# the file cachematrix.R in this repo, but I intend for it to perform the same
# purpose as that submission, but with extra bells and whistles.

makeCacheMatrix <- function (baseMatrix = matrix()) {
  
  # Set the initial value for the inverted matrix
  invMatrix <- NULL

  # Set the value for the base matrix.  As the value of the inverted 
  # matrix depends on the base matrix, its value needs to be reset
  # until its recalculated.
  set <- function (newMatrix) {

    if (is.matrix (newMatrix)) {

      if !(all(dim (baseMatrix) == dim (newMatrix)) && all(x == y)) {

        # This section can only be reached if newMatrix is a valid matrix
        # and is NOT identical to baseMatrix
        baseMatrix <<- newMatrix
        invMatrix <<- NULL

      }

    } else {

      print (c ("Non-matrix arguement sent to set() function.",
        "The value of the base matrix has NOT been changed."))

  }

  get <- function() {
    baseMatrix
  }
  
  setInverse <- function(newInvMatrix) {
    invMatrix <<- newInvMatrix
  }
  
  getInverse <- function() {
    invMatrix
  }
  
  invisible(
    list (
      set = set,
      get = get,
      setInverse = setInverse,
      getInverse = getInverse
    )
  )
}

cacheSolve <- function (x, ...) {
  
  inv <- x$getInverse()
  
  if (!is.null (inv)) {
    message ("Getting cached data.")
    return (inv)
  }
  
  data <- x$get()
  inv <- solve (data, ...)
  x$setInverse (inv)
  inv
}