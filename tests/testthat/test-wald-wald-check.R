## ---- test-wald-wald-check
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
          object = wald:::.CheckWald(
            est = c(1, 2),
            var_est = diag(x = 2),
            theta = NULL
          )
        )
        testthat::expect_error(
          object = wald:::.CheckWald(
            est = c(1, 2),
            var_est = diag(x = 3),
            theta = NULL
          )
        )
        testthat::expect_error(
          object = wald:::.CheckWald(
            est = c(1, 2),
            var_est = diag(x = 2),
            theta = 1
          )
        )
      }
    )
  },
  text = "test-wald-wald-check"
)
