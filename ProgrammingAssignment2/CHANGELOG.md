#  PROGRAMMING ASSIGNMENT 2 CHANGELOG

## 2016-05-21

### Changed (TESTING)
- cacheMatrix-1.R: added intermediate variable solvedMatrix to allow setInverse() method to issue a message if the solve() function does not produce any errors or warnings.
- cacheMatrix-1.R: added line to makeCacheMatrix() function to use the set() method as a constructor function (note: testing failed).
- cacheMatrix-1.R: added condition to check for a null baseMatrix in setInverse() method.
- cacheMatrix-1.R: fixed logic of setInverse() method to deal with the fact that all(NULL) equates to TRUE.
- cacheMatrix-1.R: added enableMessages value and code.
- cachematrix.R: minor typo corrections.

## 2016-05-2016

### Merged
- Merged recent changes back into Master branch.

### Changed (TESTING)
- Reverted to "=" assignment operator in return list for both R scripts.  Apparently the "<-" operator doesn't work in that situation.
- cacheMatrix-1.R: rewrote the cacheSolve() function.  It now only calls the getInverse() and setInverse() functions from the CacheMatrix object.
- cacheMatrix-1.R: rewrote setInverse() function to incorporate most of the code from the original cacheSolve() function.
- cacheMatrix-1.R: rewrote set() function.  This now does the following actions:
    * Verifies if the assignment value is a matrix.  It ignores the assigmnent and prints a warning message if it isn't.
    * It checks if the matrix being assigned matches the existing matrix.
    * It checks if the matrix is square and sets nonInvertible to TRUE if it is.
- cacheMatrix-1.R: added nonInvertible value.
- cachematrix.R: completed commenting.

### NEW BRANCH
- Created Testing branch

## 2016-05-19

### Changed
- Replaced "=" assignment operators in return list construct in both scripts with standard R "<-" operators.
- Added usage sample to README.
- cacheMatrix-1.R: several improvements over basic assignment:
    * Wrapped return value of makeCacheMatrix() function within an invisible() function to supress auto-printing.
    * Re-designed set() function to add error-checking of assignment value.
    * Renamed most variables to something more descriptive than the original names.
    * Added explanatory comments (in progress).
- cachematrix.R: added comments and unobfuscated variables names.

### Added
- Experimental upgrade of basic assignment with added comments and error-checking.
- CHANGELOG for programming assignment.
- First draft of Coursera submission.