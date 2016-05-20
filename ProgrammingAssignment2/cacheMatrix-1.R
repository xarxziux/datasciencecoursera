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
  
  # Thus value is a boolean indicating whether the base matrix is invertible.
  # Essentially the object has three states:
  
  # 1. nonInvertible = FALSE  && invMatrix == NULL
  # 2. nonInvertible = FALSE  && invMatrix != NULL
  # 3. nonInvertible = TRUE  && invMatrix == NULL
  
  # The first condition exists when baseMatrix is a square matrix but it is not
  # yet determined whether it is invertible.
  # The second state exists if baseMatrix is invertible and the inverse has
  # been calculated and stored.
  # The third exists if baseMatrix is not invertible.
  # The state nonInvertible = true  && baseMatrix != NULL should not be reachable.
  nonInvertible <- FALSE
  
  # Set the value for the base matrix.  As the value of the inverted 
  # matrix depends on the base matrix, its value needs to be reset
  # until its recalculated.
  set <- function (newMatrix) {

    if (is.matrix (newMatrix)) {

      if (!(all(dim (baseMatrix) == dim (newMatrix)) && all(x == y))) {

        # This section can only be reached if newMatrix is a valid matrix
        # and is NOT identical to baseMatrix
        baseMatrix <<- newMatrix
        invMatrix <<- NULL        

        # Set the value of the nonInvertible boolean based on whether the
        # new matrix is square or not
        nonInvertible <<- (dim (testMatrix)[1] != dim (testMatrix)[2])
      
      } else {
        
        message (c ("The assignment matrix is equivalent to the existing",
            " matrix.  The value of the base matrix has NOT been changed."))
        
      }

    } else {

      message (c ("Non-matrix argument sent to set() function.",
          "The value of the base matrix has NOT been changed."))
      
    }

  }

  get <- function() {
    baseMatrix
  }
  
  setInverse <- function(...) {
    
    if (nonInvertible) {
      message ("Base matrix is non-invertible.")
      return (NULL)
    } else if (!is.null (invMatrix)) {
      message ("Getting cached data.")
      return (invMatrix)
    }

    invMatrix <- tryCatch (
      solve (baseMatrix, ...),
      error <- function() {
        
        message ("solve() function returned an error.")
        nonInvertible <<- TRUE
        
      }
    )
  }
  
  getInverse <- function() {
    invMatrix
  }
  
  invisible (
    list (
      set = set,
      get = get,
      setInverse = setInverse,
      getInverse = getInverse
    )
  )
}

cacheSolve <- function (cacheObj, ...) {
  
  inverse <- cacheObj$getInverse (...)

  if (!is.null (inverse)) {
    message ("Getting cached data.")
    return (inverse)
  } else {
    cacheObj$setInverse(...)
  }
  
}
