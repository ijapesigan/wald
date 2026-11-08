# Wald Test of a Parameter Vector

Computes the Wald statistic \$\$ W = \left( \hat{\boldsymbol{\theta}} -
\boldsymbol{\theta}\_{0} \right)^{\prime} \operatorname{Var} \left(
\hat{\boldsymbol{\theta}} \right)^{-1} \left(
\hat{\boldsymbol{\theta}} - \boldsymbol{\theta}\_{0} \right) \$\$ and
its \\(p\\) value from the \\(\chi^{2}\\) distribution with degrees of
freedom equal to the number of parameters. The inverse is computed from
the Cholesky factor of `var_est`.

## Usage

``` r
Wald(est, var_est, theta = NULL)
```

## Arguments

- est:

  Numeric vector. Vector of parameter estimates
  (\\(\hat{\boldsymbol{\theta}}\\)).

- var_est:

  Numeric matrix. Sampling covariance matrix of parameter estimates
  (\\(\operatorname{Var} \left( \hat{\boldsymbol{\theta}} \right)\\)),
  symmetric and positive definite.

- theta:

  Numeric vector. Parameter values when the null hypothesis is true
  (\\(\boldsymbol{\theta}\_{0}\\)). If `NULL`, a vector of zeros.

## Value

Returns a numeric vector with the following elements:

- chisq:

  Chi-square statistic.

- df:

  Degrees of freedom.

- p:

  p value.

## See also

Other Wald Confidence Intervals Functions:
[`CIWald()`](https://ijapesigan.github.io/wald/reference/CIWald.md),
[`ProbsofAlpha()`](https://ijapesigan.github.io/wald/reference/ProbsofAlpha.md)

## Author

Ivan Jacob Agaloos Pesigan

## Examples

``` r
fit <- lm(mpg ~ wt + hp, data = mtcars)
Wald(
  est = coef(fit),
  var_est = vcov(fit),
  theta = NULL
)
#>    chisq       df        p 
#> 2058.832    3.000    0.000 
```
