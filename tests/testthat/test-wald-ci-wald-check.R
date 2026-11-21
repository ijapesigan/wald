## ---- test-wald-ci-wald-check
lapply(
  X = 1,
  FUN = function(i,
                 text) {
    testthat::skip_on_cran()
    message(text)
    testthat::test_that(
      desc = paste(text, "valid input passes, invalid input stops"),
      code = {
        testthat::expect_null(
          object = wald:::.CheckCIWald(
            est = 1,
            se = 1,
            theta = 0,
            alpha = 0.05,
            z = TRUE,
            test = FALSE
          )
        )
        testthat::expect_error(
          object = wald:::.CheckCIWald(
            est = 1,
            se = -1,
            theta = 0,
            alpha = 0.05,
            z = TRUE,
            test = FALSE
          )
        )
        testthat::expect_error(
          object = wald:::.CheckCIWald(
            est = 1,
            se = 1,
            theta = 0,
            alpha = 0.05,
            z = FALSE,
            test = FALSE
          )
        )
      }
    )
  },
  text = "test-wald-ci-wald-check"
)
