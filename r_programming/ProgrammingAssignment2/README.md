# Coursera R Programming Course #
# Programming Assignment 2 #

This is my submission for the 2nd programming assignment on the Coursera MOOC [R Programming](https://www.coursera.org/learn/r-programming).

The file cachemean.R is the example provided by the course on which my submission is based.  

The file cachematrix.R is my official course submission.

Finally the file cacheMatrix-1.R is my attempt to take the script beyond basic assignment requirements by adding data validation and error-checking routines, and by redesigning the original concept in ways that seem more in keeping with the principles of object-based programming.  This script is for demonstration and learning purposes and is not my official submission.


### Usage sample
```R
> # Load the script into the console.
> source ("cachematrix.R")
> # Create the cache object using a square matrix with an known inverse.
> cacheObject <- makeCacheMatrix (matrix (c (1,0,1,2,4,0,3,5,6),3,3))
> # Calculate, update and print the inverse of the original matrix.
> cacheSolve (cacheObject)
           [,1]        [,2]        [,3]
[1,]  1.0909091 -0.54545455 -0.09090909
[2,]  0.2272727  0.13636364 -0.22727273
[3,] -0.1818182  0.09090909  0.18181818
> 
```

