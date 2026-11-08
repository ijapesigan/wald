## ---- test-wald-probsof-alpha
lapply(
  X = 1,
  FUN = function(i,
                 text,
                 tol) {
    testthat::skip_on_cran()
    message(text)
    testthat::test_that(
      desc = text,
      code = {
        testthat::expect_true(
          object = all(
            abs(x = c(2.5, 97.5) - ProbsofAlpha(alpha = 0.05) * 100) <= tol
          )
        )
      }
    )
  },
  text = "test-wald-probsof-alpha",
  tol = 0.00001
)
