## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {

}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}

#
# This is a two step process
# 
# STEP1) Function makeCacheMatrix : 
#        To accept matrix and return special matrix 
#
# STEP2) Function cacheinverse
#        To calculate inverse matrix(if needed)
#
# Description:
#
# function makeCacheMatrix  :
#
#   Accepts a object of class "matrix"
#   Has 2 internal objects 
#      1)  om which stores original matrix
#      2)  im which stores inverse of original matrix
#   Has 4 Functions
#      1) set : stores i/p matrix to om
#               sets im to NULL
#      2) get : Returns om
#      3) setinverse  : stores im from user
#      4) getinverse  : Returns im
#
# function cachSolve:
#     
#     Works on "special matrix" ( o/p of makeCacheMatrix )
#          
#     PSEUDO LOGIC :
#        When called, receives object of special matrix
#        Gets the im of special matrix using obj$getinverse
#           If im not empty , means inverse is already calculated 
#            and stored inside special matrix
#           So it simply returns im along with msg "getting cached data"
# 
#           If im is empty, 
#             means cacheinverse is being called for the first time for object
#             It gets original matrix using obj$get() function
#             Then calculates inverse using solve
#             Passes the inverse to special matrix obj using setinverse
#             Gets the inverse from special matrix using getinverse and return to user
#
#

# function to convert matrix to "special matrix"
makeCacheMatrix <- function(m = matrix()) {

#  set im ( variable to store inverse matrix ) to NULL 
		im <- NULL 

        # Function to set matrix to om ( original matrix)
        set <- function(mat) {
                om <<- mat
                im <<- NULL
        }
         
		# Function to get value of original matrix 
        get <- function() om
		
		# Function to set value of im (inverse matrix)
        setinverse <- function(mi) im <<- mi
		
		# Function to get value of im (inverse matrix)
        getinverse <- function() im

		# Calling set function to set the om initally
		#set(m)
		
        list(set = set, get = get,
             setinverse = setinverse,
             getinverse = getinverse)
}

# function to get or calculate inverse matrix 
cacheSolve <- function(x) {

        # Check if inverse matrix exits
        m <- x$getinverse()
		
        # if exits , print msg and return im
		if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
		
		# if im not exits, get the original data
        data <- x$get()
		# calculate the inverse matrix
        m <- solve(data)
        # save the inverse matrix value for future use
		x$setinverse(m)
		# return the inverse matrix value
        x$getinverse()

}

## End of Script
