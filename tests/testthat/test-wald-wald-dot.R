## ---- test-wald-wald-dot
lapply(
  X = 1,
  FUN = function(i,
                 text) {
    testthat::skip_on_cran()
    message(text)
    testthat::test_that(
      desc = paste(text, "statistic with and without theta"),
      code = {
        out <- wald:::.Wald(est = c(1, 2), var_inv = diag(x = 2))
        testthat::expect_equal(
          object = unname(obj = out),
          expected = c(
            5,
            2,
            stats::pchisq(q = 5, df = 2, lower.tail = FALSE)
          )
        )
        testthat::expect_equal(
          object = unname(
            obj = wald:::.Wald(
              est = c(1, 2),
              var_inv = diag(x = 2),
              theta = c(1, 2)
            )["chisq"]
          ),
          expected = 0
        )
      }
    )
  },
  text = "test-wald-wald-dot"
)
