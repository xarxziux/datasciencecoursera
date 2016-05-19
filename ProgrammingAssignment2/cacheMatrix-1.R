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