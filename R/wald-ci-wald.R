#' Wald Tests and Confidence Intervals
#'
#' Computes, for each parameter,
#' the Wald test statistic
#' \eqn{\left( \hat{\theta} - \theta_{0} \right) / \mathrm{se}},
#' its two-sided \eqn{p} value,
#' and Wald confidence intervals,
#' from the standard normal or the \eqn{t} distribution.
#'
#' @author Ivan Jacob Agaloos Pesigan
#'
#' @param est Numeric vector.
#'   Estimates.
#' @param se Numeric vector.
#'   Standard errors of estimates.
#' @param theta Numeric vector.
#'   Parameter values when the null hypothesis is true,
#'   of length one or of the length of `est`.
#' @param alpha Numeric vector.
#'   Significance level/s.
#' @param z Logical.
#'   If `z = TRUE`,
#'   use the standard normal distribution.
#'   If `z = FALSE`,
#'   use the t distribution.
#' @param df Numeric.
#'   Degrees of freedom if `z = FALSE`.
#' @param test Logical.
#'   If `TRUE`,
#'   return only the results of hypothesis tests.
#'   If `FALSE`,
#'   return both results of hypothesis tests and confidence intervals.
#'
#' @return Returns a numeric matrix with one row per parameter
#'   and the following columns:
#'   \describe{
#'     \item{est}{Estimates.}
#'     \item{se}{Standard errors.}
#'     \item{z or t}{Test statistics.}
#'     \item{df}{Degrees of freedom (`z = FALSE` only).}
#'     \item{p}{Two-sided p values.}
#'     \item{ci}{Confidence limits, one column per probability,
#'       named as percentages, for example `2.5%` and `97.5%`.}
#'   }
#'   If `test = TRUE`, the confidence limits are omitted.
#'
#' @examples
#' fit <- lm(mpg ~ wt + hp, data = mtcars)
#' CIWald(
#'   est = coef(fit),
#'   se = sqrt(diag(vcov(fit))),
#'   alpha = 0.05,
#'   z = FALSE,
#'   df = df.residual(fit)
#' )
#'
#' @family Wald Confidence Intervals Functions
#' @keywords wald ci
#' @export
CIWald <- function(est,
                   se,
                   theta = 0,
                   alpha = c(0.05, 0.01, 0.001),
                   z = FALSE,
                   df,
                   test = FALSE) {
  .CheckCIWald(
    est = est,
    se = se,
    theta = theta,
    alpha = alpha,
    z = z,
    df = df,
    test = test
  )
  .CIWald(
    est = est,
    se = se,
    theta = theta,
    alpha = alpha,
    z = z,
    df = df,
    test = test
  )
}
