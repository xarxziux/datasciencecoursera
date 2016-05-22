# cacheMatrix-1.R
# Version 0.0.2-alpha
# Created 19-May-2016
# Last updated 22-May-2016

# This is an alternative version of my submission of the second programming
# assignment for the Coursera R Programming course.  This version goes beyond
# the basic requirements for the course by adding additional error-checking
# routines, and drawing in ideas from other parts of the course materials.

# This version was partially founded on my attempt to understand what the
# course-provided example, cachmean.R, was doing, and partially from my
# interest in finding a simpler way of solving the same problem.  This script
# is still under development and is NOT my official submission, for that see
# the file cachematrix.R in this repo, but I intend for it to perform the same
# purpose as that submission, but with extra bells and whistles.

# The object described in this function has four properties:
# baseMatrix is the matrix set up by the initial declaration or through the get()
# method.
# invMatrix is the inverse of the baseMatrix, if it has one and has been calculated by
# the setInverse() method.  Both of these were present in the original submission
# version.
# nonInvertible is a boolean value indicating whether the base matrix has an inverse.
# By default this is FALSE but can be changed to TRUE if the set() method receives
# a non-square matrix or if solve() function called by the setInverse() method returns
# an error.
# enableMessages is a boolean set up at creation time only that states whether to allow
# the methods to print messages.

# KNOW ISSUES:
# If the baseMatrix value is set when the object is created, the data validation and
# error-checking of the set() method are not run.
# If the solve() function returns an error, the getInverse() method assumes that the
# base matrix is non-invertible.  This need to be verified/expanded.

makeCacheMatrix <- function (initMatrix = matrix(), enableMessages = FALSE) {
  
  # Set the initial value for the two matrices
  invMatrix <- NULL
  baseMatrix <- NULL
  
  # This value is a boolean indicating whether the base matrix is invertible.
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
      
      # This tests whether the new matrix is equivalent (same dimensions
      # and elements) as the base matrix.  The is.null condition is needed since
      # all(NULL) evaluates to TRUE.
      if (!(is.null (baseMatrix))  &&
          (all(dim (baseMatrix) == dim (newMatrix))) && 
          (all(baseMatrix == newMatrix))) {

        if (enableMessages) {
          message (c ("The assignment matrix is equivalent to the existing",
                      " matrix.  The value of the base matrix has NOT been changed."))
        }
      } else {

        # This section can only be reached if newMatrix is a valid matrix
        # and is NOT identical to baseMatrix
        if (enableMessages) {
          message ("The value of the base matrix has been updated.")
        }

        baseMatrix <<- newMatrix
        invMatrix <<- NULL        

        # Set the value of the nonInvertible boolean based on whether the
        # new matrix is square or not
        nonInvertible <<- (dim (baseMatrix)[1] != dim (baseMatrix)[2])
      }

    } else {

      if (enableMessages) {
        message (c ("Non-matrix argument sent to set() function.",
            "  The value of the base matrix has NOT been changed."))
      }
    }
  }

  get <- function() {
    baseMatrix
  }
  
  setInverse <- function(...) {
    
    if (is.null (baseMatrix)) {
      if (enableMessages) {
        message ("Base matrix is null.  Unable to set it's inverse.")
      }
      return (NULL)
    }
    
    if (nonInvertible) {

      if (enableMessages) {
        message ("Base matrix is non-invertible.")
      }

      return (NULL)

    }
    
    if (!is.null (invMatrix)) {

      if (enableMessages) {
        message ("Getting cached data.")
      }
      
      return (invMatrix)
    }

    invMatrix <<- tryCatch (
      {
        solvedMatrix <- solve (baseMatrix, ...)
        if (enableMessages) {
          message ("Inverse matrix has been solved and cached.")
        }
        solvedMatrix
      },
      
      warning = function (war) {
        
        if (enableMessages) {
          message (c("solve() function returned a warning: ",
                     war$message, ","))
        }
        
      },
      error = function (err) {

        if (enableMessages) {
          message (c("solve() function returned an error:",
                     err$message, ","))
        }
        
        nonInvertible <<- TRUE
        
      }
    )
  }
  
  getInverse <- function() {
    
    if ((is.null (invMatrix)) && !nonInvertible && enableMessages) {
      message (c("Inverse matrix value has not been calculated.",
                 "  Call setInverse() method first."))
      
    }
    
    invMatrix
  }
  
  # Without completely re-designing this object, this seems like the best waY
  # to utilise the get() method as a constructor function.
  # Or maybe not.  This is producing unexpected results in testing.
  baseMatrix <- set (initMatrix)
  
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

# With the original functionality of this function now contained with the setInverse()
# method, this function now only uses the getter and setter functions of the cache 
# object to perform the job it used to.
cacheSolve <- function (cacheObj, ...) {
  
  inverse <- cacheObj$getInverse (...)

  if (!is.null (inverse)) {
    return (inverse)
  } else {
    cacheObj$setInverse(...)
  }
}


