# Coursera R Programming Course #
# Programming Assignment 2 #

This is my submission for the 2nd programming assignment on the Coursera MOOC [https://www.coursera.org/learn/r-programming](R Programming).  The course submission is contained in the file cachematrix.R.  The file cachemean.R is the example provided by the course on which my submission is based on. 


### Usage sample
```R
> # Load the script into the console.
> source ("Cache_Matrix.R")
> # Create the cache object using a square matrix with an known inverse.
> cacheObject <- makeCacheMatrix (matrix (c (1,0,1,2,4,0,3,5,6),3,3))
> # Calculate, update and print the inverse of the original matrix
> cacheSolve (cacheObject)
           [,1]        [,2]        [,3]
[1,]  1.0909091 -0.54545455 -0.09090909
[2,]  0.2272727  0.13636364 -0.22727273
[3,] -0.1818182  0.09090909  0.18181818
> 
```

