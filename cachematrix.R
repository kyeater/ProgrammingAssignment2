## Lexical scoping and caching functions

## First function, makeCacheMatrix creates a special "matrix" object
## that can cache the input matrix and its inverse
## Initialize variable 'm'
## provide function get() to obtain matrix
## provide function setmatrix() to assign inverse matrix to m
## provide function getmatrix() to obtain cached inverse matrix

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
	get <- function() x
	setmatrix <- function(y) m <<- y 
	getmatrix <- function() m

	list(get=get, setmatrix=setmatrix, getmatrix=getmatrix)
	## creates lists for the functions
}


## Second function, cacheSolve calls functions stored in matrix returned by makeCacheMatrix
## If inverse is calculated, the cacheSolve retrieves inverse from the cache
## If input is new, calculates inverse and sets the inverse in the cache  

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getmatrix()
		if(!is.null(m)) {
			message("Cached data found.  Getting result... Done.")
			return(m)
	}
	else {
		message("No cached data found.  Calculating inverse matrix...")
		data <- x$get()
		m <- solve(data)
		x$setmatrix(m)
		message("Done.")
		return(m)
	}
}
