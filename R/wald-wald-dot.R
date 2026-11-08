#' Wald Test of a Parameter Vector (Internal)
#'
#' Computes the Wald statistic
#' \deqn{
#'   W =
#'   \left( \hat{\boldsymbol{\theta}} - \boldsymbol{\theta}_{0} \right)^{\prime}
#'   \operatorname{Var} \left( \hat{\boldsymbol{\theta}} \right)^{-1}
#'   \left( \hat{\boldsymbol{\theta}} - \boldsymbol{\theta}_{0} \right)
#' }
#' and its \eqn{p} value from the \eqn{\chi^{2}} distribution
#' with degrees of freedom equal to the number of parameters.
#' No input checks: see [Wald()].
#'
#' @author Ivan Jacob Agaloos Pesigan
#'
#' @param est Numeric vector.
#'   Vector of parameter estimates
#'   (\eqn{\hat{\boldsymbol{\theta}}}).
#' @param var_inv Numeric matrix.
#'   Inverse of the sampling covariance matrix of parameter estimates
#'   (\eqn{\operatorname{Var} \left( \hat{\boldsymbol{\theta}} \right)^{-1}}).
#' @param theta Numeric vector.
#'   Parameter values when the null hypothesis is true
#'   (\eqn{\boldsymbol{\theta}_{0}}).
#'   If `NULL`, a vector of zeros.
#'
#' @return Returns a numeric vector with the following elements:
#'   \describe{
#'     \item{chisq}{Chi-square statistic.}
#'     \item{df}{Degrees of freedom.}
#'     \item{p}{p value.}
#'   }
#'
#' @examples
#' .Wald(
#'   est = c(0.5, 0.25),
#'   var_inv = diag(x = 100, nrow = 2),
#'   theta = NULL
#' )
#'
#' @family Wald Confidence Intervals Functions
#' @keywords wald multivariate internal
#' @noRd
.Wald <- function(est,
                  var_inv,
                  theta = NULL) {
  if (is.null(x = theta)) {
    dif <- est
  } else {
    dif <- est - theta
  }
  chisq <- crossprod(
    x = dif,
    y = var_inv
  ) %*% dif
  df <- length(x = dif)
  p <- stats::pchisq(
    q = chisq,
    df = df,
    lower.tail = FALSE
  )
  c(
    chisq = chisq,
    df = df,
    p = p
  )
}
