#' Check the Arguments of CIWald()
#'
#' Stops with an error when an argument of [CIWald()] is not valid:
#' `est` and `se` are numeric vectors of the same length,
#' `se` is positive,
#' `theta` has length one or the length of `est`,
#' `alpha` lies in \eqn{(0, 1)},
#' `z` and `test` are single logical values,
#' and `df` is a positive number when `z = FALSE`.
#'
#' @author Ivan Jacob Agaloos Pesigan
#'
#' @inheritParams CIWald
#'
#' @return Returns `NULL`, invisibly, when every argument is valid.
#'
#' @examples
#' .CheckCIWald(
#'   est = c(0.5, 0.25),
#'   se = c(0.1, 0.1),
#'   theta = 0,
#'   alpha = 0.05,
#'   z = TRUE,
#'   test = FALSE
#' )
#'
#' @family Wald Confidence Intervals Functions
#' @keywords wald ci internal
#' @noRd
.CheckCIWald <- function(est,
                         se,
                         theta,
                         alpha,
                         z,
                         df,
                         test) {
  stopifnot(
    is.numeric(x = est),
    is.numeric(x = se),
    length(x = se) == length(x = est),
    all(se > 0),
    is.numeric(x = theta),
    length(x = theta) %in% c(1L, length(x = est)),
    is.numeric(x = alpha),
    all(alpha > 0 & alpha < 1),
    is.logical(x = z),
    length(x = z) == 1L,
    is.logical(x = test),
    length(x = test) == 1L
  )
  if (!z) {
    stopifnot(
      !missing(x = df),
      is.numeric(x = df),
      all(df > 0)
    )
  }
  invisible(x = NULL)
}
