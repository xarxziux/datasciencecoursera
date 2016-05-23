# cacheMatrix.R
# Version 0.0.3
# Created 26-Feb-2016
# Last updated 22-May-2016

# This is my official submission for the second programming assignment for the
# Coursesa R Programming course.  This script is essentially a re-write of the
# course-provided script cachemean.R, but modified to cache the inverse of a
# matrix instead of the mean of a vector.  This script also unobfuscates the
# variable names and style of the original to make it clearer what is going on.

# This function creates the basic data structures needed for this assignment.
# In essence it is an object with 2 properties and 4 methods.  The methods are
# stored in a returned list, while the properties are stored... somewhere.
# I know this code works as I've tested it enough. I'm just not
# entirely clear how yet.
makeCacheMatrix <- function (baseMatrix = matrix()) {
  
  # Set the initial value for the inverse matrix
  invMatrix <- NULL

  # Update the base matrix and reset its inverse as the inverse will need to be
  # recalculated every time the base matrix is changed.
  set <- function (newMatrix) {
    baseMatrix <<- newMatrix
    invMatrix <<- NULL
  }

  # Return the base matrix
  get <- function() {
    baseMatrix
  }
  
  # *In theory* this function updates the inverse matrix, as it is called
  # from the cacheSolve() function, but in reality it just updates the value
  # of the inverse matrix to whatever value it is sent to it, which without
  # error-checking could be absolutely anything.  The invMatrix value may be
  # storing a chicken sandwich for all this function knows.  In the context of
  # object-based programming, this looks like a poor design decision.  Surely
  # the cacheSolve() function should be contained within this function?
  setInverse <- function(newInvMatrix) {
    invMatrix <<- newInvMatrix
  }
  
  # Returns the value of the inverse matrix
  getInverse <- function() {
    invMatrix 
  }
  
  # Wrap the return value in an invisible() function to supress autoprinting
  invisible (
    list (
      set = set,
      get = get,
      setInverse = setInverse,
      getInverse = getInverse
    )
  )
}

# This function accepts the object created by the makeCacheMatrix() function
# and updates the value of the inverse matrix.  This mirrors the structure
# of the course-provided cachemean.R script.
cacheSolve <- function (x, ...) {
  
  # Ask the object to pull the value of inverse matrix back from the void.
  inv <- x$getInverse()
  
  # If the value of the inverse matrix is set, return that...
  if (!is.null (inv)) {
    message ("Getting cached data.")
    return (inv)
  }
  
  # ...otherwise calculate it and update the object.
  inv <- solve (x$get(), ...)
  x$setInverse (inv)
  inv
}


