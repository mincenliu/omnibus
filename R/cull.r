#' Force all vectors to have length equal to the shortest or all data frames or matrices to have same number of rows as shortest.
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
	if (class(x[[1]]) %in% c('data.frame', 'maxtrix')) {
		
		# cull
		minLength <- min(sapply(x, nrow))
		for (i in seq_along(x)) x[[i]] <- x[[i]][1:minLength, ]

	# if vectors
	} else {

		# cull
		minLength <- min(sapply(x, length))
		for (i in seq_along(x)) x[[i]] <- x[[i]][1:minLength]
	
	}
	
	# name elements of output same as names of x
	# name elements of output same as names of x
	# called <- as.list(substitute(list(...)))[-1L]
	# inNames <- character()
	# for (i in seq_along(x)) inNames <- c(inNames, as.character(called[[i]]))
	inNames <- ellipseNames(...)
	if (length(inNames) == length(x)) names(x) <- inNames
	
	x

}
