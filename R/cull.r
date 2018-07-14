#' Force objects to have length or rows equal to the shortest
#'
#' @param ... Vectors, matrices, or data frames.
#' @examples
#' a <- 1:10
#' b <- 1:20
#' c <- letters
#' cull(a, b, c)
#' x <- data.frame(x=1:10, y=letters[1:10])
#' y <- data.frame(x=1:26, y=letters)
#' cull(x, y)
#' @export
cull <- function(...) {

	# input/output
	x <- list(...)

	# if data frames or matrices
	if (class(x[[1]]) %in% c('data.frame', 'matrix')) {
		
		# cull
		minLength <- min(sapply(x, nrow))
		for (i in seq_along(x)) x[[i]] <- x[[i]][1:minLength, , drop=FALSE]

	# if vectors
	} else {

		# cull
		minLength <- min(sapply(x, length))
		for (i in seq_along(x)) x[[i]] <- x[[i]][1:minLength]
	
	}
	
	# name elements of output same as names of x
	inNames <- ellipseNames(...)
	if (length(inNames) == length(x)) names(x) <- inNames
	
	x

}

