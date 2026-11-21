## ---- test-wald-probs-of-alpha-dot
lapply(
  X = 1,
  FUN = function(i,
                 text) {
    testthat::skip_on_cran()
    message(text)
    testthat::test_that(
      desc = paste(text, "sorted lower and upper probabilities"),
      code = {
        testthat::expect_equal(
          object = wald:::.ProbsofAlpha(alpha = c(0.05, 0.01)),
          expected = c(0.005, 0.025, 0.975, 0.995)
        )
      }
    )
  },
  text = "test-wald-probs-of-alpha-dot"
)
