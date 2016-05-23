#  PROGRAMMING ASSIGNMENT 2 CHANGELOG

## 2016-05-22

### Changed
- cachematrix.R: minor typo corrrections.
- cachematrix.R: removed unnecessary "data"" value from cachesolve function.

## 2016-05-20

### Changed (TESTING)
- Reverted to "=" assignment operator in return list for both R scripts.  Apparently the "<-" operator doesn't work in that situation.
- Rewrote the cacheSolve() function in cacheMatrix-1.R.  It now only calls the getInverse() and setInverse() functions from the CacheMatrix object.
- Rewrote setInverse() function in cacheMatrix-1.R to incorporate most of the code from the original cacheSolve() function.
- Rewrote set() function in cacheMatrix-1.R.  This now does the following actions:
    * Verifies if the assignment value is a matrix.  It ignores the assigmnent and prints a warning message if it isn't.
    * It checks if the matrix being assigned matches the existing matrix.
    * It checks if the matrix is square and sets nonInvertible to TRUE if it is.
- Added nonInvertible value to cacheMatrix-1.R.
- Completed commenting of cachematrix.R.

### NEW BRANCH
- Created Testing branch

## 2016-05-19

### Changed
- Replaced "=" assignment operators in return list construct with standard R "<-" operators.
- Added usage sample to README.
- Several improvements to cacheMatrix-1.R over basic assignment:
    * Wrapped return value of makeCacheMatrix() function within an invisible() function to supress auto-printing.
    * Re-designed set() function to add error-checking of assignment value.
    * Renamed most variables to something more descriptive than the original names.
    * Added explanatory comments (in progress).
- Added comments and unobfuscated variables names in cachematrix.R.

### Added
- Experimental upgrade of basic assignment with added comments and error-checking.
- CHANGELOG for programming assignment.
- First draft of Coursera submission.