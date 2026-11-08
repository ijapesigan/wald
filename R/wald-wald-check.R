#' Check the Arguments of Wald()
#'
#' Stops with an error when an argument of [Wald()] is not valid:
#' `est` is a vector,
#' `var_est` is a square matrix with one row per element of `est`,
#' and `theta`, when not `NULL`, is a vector of the length of `est`.
#'
#' @author Ivan Jacob Agaloos Pesigan
#'
#' @inheritParams Wald
#'
#' @return Returns `NULL`, invisibly, when every argument is valid.
#'
#' @examples
#' .CheckWald(
#'   est = c(0.5, 0.25),
#'   var_est = diag(x = 0.01, nrow = 2),
#'   theta = NULL
#' )
#'
#' @family Wald Confidence Intervals Functions
#' @keywords wald multivariate internal
#' @noRd
.CheckWald <- function(est,
                       var_est,
                       theta) {
  stopifnot(
    is.vector(x = est),
    is.matrix(x = var_est)
  )
  dims <- dim(x = var_est)
  p <- length(x = est)
  stopifnot(
    dims[1] == dims[2],
    p == dims[1]
  )
  if (!is.null(x = theta)) {
    stopifnot(
      is.vector(x = theta),
      length(x = theta) == p
    )
  }
  invisible(x = NULL)
}
