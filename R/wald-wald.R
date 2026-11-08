#' Wald Test of a Parameter Vector
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
#' The inverse is computed from the Cholesky factor of `var_est`.
#'
#' @author Ivan Jacob Agaloos Pesigan
#'
#' @param est Numeric vector.
#'   Vector of parameter estimates
#'   (\eqn{\hat{\boldsymbol{\theta}}}).
#' @param var_est Numeric matrix.
#'   Sampling covariance matrix of parameter estimates
#'   (\eqn{\operatorname{Var} \left( \hat{\boldsymbol{\theta}} \right)}),
#'   symmetric and positive definite.
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
#' fit <- lm(mpg ~ wt + hp, data = mtcars)
#' Wald(
#'   est = coef(fit),
#'   var_est = vcov(fit),
#'   theta = NULL
#' )
#'
#' @family Wald Confidence Intervals Functions
#' @keywords wald multivariate
#' @export
Wald <- function(est,
                 var_est,
                 theta = NULL) {
  .CheckWald(
    est = est,
    var_est = var_est,
    theta = theta
  )
  .Wald(
    est = est,
    var_inv = chol2inv(
      x = chol(
        x = var_est
      )
    ),
    theta = theta
  )
}
