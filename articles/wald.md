# wald: Wald Tests and Confidence Intervals

## Description

Wald tests and Wald confidence intervals in R (R Core Team, 2026). Each
exported function has an internal version without input checks that
other projects can copy.

## Installation

You can install the development version of `wald` from
[GitHub](https://github.com/ijapesigan/wald) with:

\
`if`` ``(``!`[`require`](https://rdrr.io/r/base/library.html)`(`[`"pak"`](https://pak.r-lib.org/)`)``)`` `[`install.packages`](https://rdrr.io/r/utils/install.packages.html)`(``"pak"``)`\
`pak``::`[`pkg_install`](https://pak.r-lib.org/reference/pkg_install.html)`(``"ijapesigan/wald"``)`

## Example

\
[`library`](https://rdrr.io/r/base/library.html)`(``package ``=`` ``"wald"``)`

A linear regression model fitted to the `mtcars` data.

\
`fit`` ``<-`` ``stats``::`[`lm`](https://rdrr.io/r/stats/lm.html)`(`\
`  formula ``=`` ``mpg`` ``~`` ``wt`` ``+`` ``hp``,`\
`  data ``=`` ``datasets``::`[`mtcars`](https://rdrr.io/r/datasets/mtcars.html)\
`)`

### Tests and Confidence Intervals for Each Parameter

[`CIWald()`](https://ijapesigan.github.io/wald/reference/CIWald.md)
tests each parameter against `theta` and gives Wald confidence intervals
from the t distribution (`z = FALSE`) or the standard normal
distribution (`z = TRUE`).

\
[`CIWald`](https://ijapesigan.github.io/wald/reference/CIWald.md)`(`\
`  est ``=`` ``stats``::`[`coef`](https://rdrr.io/r/stats/coef.html)`(``object ``=`` ``fit``)``,`\
`  se ``=`` `[`sqrt`](https://rdrr.io/r/base/MathFun.html)`(``x ``=`` `[`diag`](https://rdrr.io/r/base/diag.html)`(``x ``=`` ``stats``::`[`vcov`](https://rdrr.io/r/stats/vcov.html)`(``object ``=`` ``fit``)``)``)``,`\
`  theta ``=`` ``0``,`\
`  alpha ``=`` `[`c`](https://rdrr.io/r/base/c.html)`(``0.05``, ``0.01``)``,`\
`  z ``=`` ``FALSE``,`\
`  df ``=`` ``stats``::`[`df.residual`](https://rdrr.io/r/stats/df.residual.html)`(``object ``=`` ``fit``)`\
`)`\
`#>                     est         se         t df            p        0.5%`\
`#> (Intercept) 37.22727012 1.59878754 23.284689 29 2.565459e-20 32.82039468`\
`#> wt          -3.87783074 0.63273349 -6.128695 29 1.119647e-06 -5.62188843`\
`#> hp          -0.03177295 0.00902971 -3.518712 29 1.451229e-03 -0.05666231`\
`#>                    2.5%       97.5%        99.5%`\
`#> (Intercept) 33.95738245 40.49715778 41.634145549`\
`#> wt          -5.17191604 -2.58374544 -2.133773058`\
`#> hp          -0.05024078 -0.01330512 -0.006883583`

With `test = TRUE`, only the tests are returned.

\
[`CIWald`](https://ijapesigan.github.io/wald/reference/CIWald.md)`(`\
`  est ``=`` ``stats``::`[`coef`](https://rdrr.io/r/stats/coef.html)`(``object ``=`` ``fit``)``,`\
`  se ``=`` `[`sqrt`](https://rdrr.io/r/base/MathFun.html)`(``x ``=`` `[`diag`](https://rdrr.io/r/base/diag.html)`(``x ``=`` ``stats``::`[`vcov`](https://rdrr.io/r/stats/vcov.html)`(``object ``=`` ``fit``)``)``)``,`\
`  z ``=`` ``TRUE``,`\
`  test ``=`` ``TRUE`\
`)`\
`#>                     est         se         z             p`\
`#> (Intercept) 37.22727012 1.59878754 23.284689 6.337117e-120`\
`#> wt          -3.87783074 0.63273349 -6.128695  8.860267e-10`\
`#> hp          -0.03177295 0.00902971 -3.518712  4.336473e-04`

### Joint Test of the Slopes

[`Wald()`](https://ijapesigan.github.io/wald/reference/Wald.md) tests
the null hypothesis that a vector of parameters equals `theta` (zeros
when `theta = NULL`), from the \chi^{2} distribution.

\
`slopes`` ``<-`` `[`c`](https://rdrr.io/r/base/c.html)`(``"wt"``, ``"hp"``)`\
[`Wald`](https://ijapesigan.github.io/wald/reference/Wald.md)`(`\
`  est ``=`` ``stats``::`[`coef`](https://rdrr.io/r/stats/coef.html)`(``object ``=`` ``fit``)``[``slopes``]``,`\
`  var_est ``=`` ``stats``::`[`vcov`](https://rdrr.io/r/stats/vcov.html)`(``object ``=`` ``fit``)``[``slopes``, ``slopes``]``,`\
`  theta ``=`` ``NULL`\
`)`\
`#>        chisq           df            p `\
`#> 1.384224e+02 2.000000e+00 8.748869e-31`

### Probabilities of Significance Levels

[`ProbsofAlpha()`](https://ijapesigan.github.io/wald/reference/ProbsofAlpha.md)
returns the tail probabilities that define two-sided intervals.

\
[`ProbsofAlpha`](https://ijapesigan.github.io/wald/reference/ProbsofAlpha.md)`(``alpha ``=`` `[`c`](https://rdrr.io/r/base/c.html)`(``0.05``, ``0.01``, ``0.001``)``)`\
`#> [1] 0.0005 0.0050 0.0250 0.9750 0.9950 0.9995`

## Documentation

See [GitHub Pages](https://ijapesigan.github.io/wald) for package
documentation.

## References

R Core Team. (2026). *R: A language and environment for statistical
computing*. R Foundation for Statistical Computing.
<https://www.R-project.org/>
