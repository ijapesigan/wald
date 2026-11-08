# Wald Tests and Confidence Intervals

Computes, for each parameter, the Wald test statistic \\(\left(
\hat{\theta} - \theta\_{0} \right) / \mathrm{se}\\), its two-sided
\\(p\\) value, and Wald confidence intervals, from the standard normal
or the \\(t\\) distribution.

## Usage

``` r
CIWald(
  est,
  se,
  theta = 0,
  alpha = c(0.05, 0.01, 0.001),
  z = FALSE,
  df,
  test = FALSE
)
```

## Arguments

- est:

  Numeric vector. Estimates.

- se:

  Numeric vector. Standard errors of estimates.

- theta:

  Numeric vector. Parameter values when the null hypothesis is true, of
  length one or of the length of `est`.

- alpha:

  Numeric vector. Significance level/s.

- z:

  Logical. If `z = TRUE`, use the standard normal distribution. If
  `z = FALSE`, use the t distribution.

- df:

  Numeric. Degrees of freedom if `z = FALSE`.

- test:

  Logical. If `TRUE`, return only the results of hypothesis tests. If
  `FALSE`, return both results of hypothesis tests and confidence
  intervals.

## Value

Returns a numeric matrix with one row per parameter and the following
columns:

- est:

  Estimates.

- se:

  Standard errors.

- z or t:

  Test statistics.

- df:

  Degrees of freedom (`z = FALSE` only).

- p:

  Two-sided p values.

- ci:

  Confidence limits, one column per probability, named as percentages,
  for example `2.5%` and `97.5%`.

If `test = TRUE`, the confidence limits are omitted.

## See also

Other Wald Confidence Intervals Functions:
[`ProbsofAlpha()`](https://ijapesigan.github.io/wald/reference/ProbsofAlpha.md),
[`Wald()`](https://ijapesigan.github.io/wald/reference/Wald.md)

## Author

Ivan Jacob Agaloos Pesigan

## Examples

``` r
fit <- lm(mpg ~ wt + hp, data = mtcars)
CIWald(
  est = coef(fit),
  se = sqrt(diag(vcov(fit))),
  alpha = 0.05,
  z = FALSE,
  df = df.residual(fit)
)
#>                     est         se         t df            p        2.5%
#> (Intercept) 37.22727012 1.59878754 23.284689 29 2.565459e-20 33.95738245
#> wt          -3.87783074 0.63273349 -6.128695 29 1.119647e-06 -5.17191604
#> hp          -0.03177295 0.00902971 -3.518712 29 1.451229e-03 -0.05024078
#>                   97.5%
#> (Intercept) 40.49715778
#> wt          -2.58374544
#> hp          -0.01330512
```
