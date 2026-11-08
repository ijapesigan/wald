# Probabilities of Two-Sided Significance Levels

Returns the lower and upper tail probabilities \\(\alpha / 2\\) and
\\(1 - \alpha / 2\\) of each two-sided significance level \\(\alpha\\),
sorted in increasing order.

## Usage

``` r
ProbsofAlpha(alpha = c(0.05, 0.01, 0.001))
```

## Arguments

- alpha:

  Numeric vector. Significance level/s.

## Value

Returns a numeric vector of probabilities of length `2 * length(alpha)`.

## See also

Other Wald Confidence Intervals Functions:
[`CIWald()`](https://ijapesigan.github.io/wald/reference/CIWald.md),
[`Wald()`](https://ijapesigan.github.io/wald/reference/Wald.md)

## Author

Ivan Jacob Agaloos Pesigan

## Examples

``` r
ProbsofAlpha(alpha = c(0.05, 0.01, 0.001))
#> [1] 0.0005 0.0050 0.0250 0.9750 0.9950 0.9995
```
