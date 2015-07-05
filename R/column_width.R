#' Calculate the width of an A0 column
#' @param ncol the required number of columns
#' @param space the space in between two columns in mm
#' @export
#' @importFrom assertthat is.count is.number
column_width <- function(ncol = 3, space = 20){
  if (!is.count(ncol)) {
    stop("ncol must be a single positive integer")
  }
  if (!is.number(space)) {
    stop("space must be a single number")
  }
  if (space < 0) {
    stop("space must be positive")
  }
  
  outer.border <- 20 # should match the \outerborder from beamerthemeciposter.sty
  inner.border <- 30 # should match the \outerborder from beamerthemeciposter.sty
  (839.6 - 2 * (outer.border + inner.border) - (ncol - 1) * space) / ncol
}

#' Calculate the starting position of a column
#' @param start the number of the columns
#' @inheritParams column_width
#' @export
#' @importFrom assertthat is.count
column_start <- function(ncol = 3, start = 1, space = 20){
  if (!is.count(start)) {
    stop("start must be a single positive integer")
  }
  width <- column_width(ncol = ncol, space = space)
  if (start > ncol) {
    warning("start > ncol. start = ncol used instead")
    start <- ncol
  }
  (start - 1) * (width + space)
}
