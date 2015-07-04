#' Calculate the width of an A0 column
#' @param ncol the required number of columns
#' @param space the space in between two columns in mm
#' @export
column_width <- function(ncol = 3, space = 20){
  outer.border <- 20 # should match the \outerborder from beamerthemeciposter.sty
  inner.border <- 30 # should match the \outerborder from beamerthemeciposter.sty
  (839.6 - 2 * (outer.border + inner.border) - (ncol - 1) * space) / ncol
}

#' Calculate the starting position of a column
#' @param start the number of the columns
#' @inheritParams column_width
#' @export
column_start <- function(ncol = 3, start = 1, space = 20){
  width <- column_width(ncol = ncol, space = space)
  (start - 1) * (width + space)
}
