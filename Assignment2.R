## About the Program
	# makeCacheMatrix function returns following functions list
		# setMatrix ()      set the value for matrix
		# getMatrix ()      get the value of a matrix		
		# getInverse ()    get the inverse of the matrix
		# cacheInverse ()   get the cahced value (inverse of the matrix)
#function makeCacheMatrix
makeCacheMatrix <- function(x = numeric()) {
        
        #Initialize cache to NULL
        cache <- NULL
        
        # setMatrix store a matrix
        setMatrix <- function(newValue) {
                x <<- newValue
                # since the matrix is assigned a new value, flush the cache
                cache <<- NULL
        }

        # getMatrix returns the cached matrix
        getMatrix <- function() {
                x
        }

        # cacheInverse cache the given argument 
        cacheInverse <- function(solve) {
                cache <<- solve
        }

        # getInverser get the cached value
        getInverse <- function() {
                cache
        }
        
        # list having named element of the list
        list(setMatrix = setMatrix, getMatrix = getMatrix, cacheInverse = cacheInverse, getInverse = getInverse)
}
# makeCacheMatrix
cacheSolve <- function(y, ...) {
        # obtain cached value
        inverse <- y$getInverse()
        
        if(!is.null(inverse)) { # if cache value not NULL retrun it
                message("getting cached data")
                return(inverse)
        }
        # Or else obtain matrix, calculate the inverse and store        
        data <- y$getMatrix()
        inverse <- solve(data)
        y$cacheInverse(inverse)
        
        # return the inverse
        inverse
}