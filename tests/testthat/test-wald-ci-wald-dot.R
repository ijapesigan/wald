## ---- test-wald-ci-wald-dot
lapply(
  X = 1,
  FUN = function(i,
                 text) {
    testthat::skip_on_cran()
    message(text)
    testthat::test_that(
      desc = paste(text, "z intervals and test only"),
      code = {
        out <- wald:::.CIWald(est = c(1, 2), se = c(0.5, 1), z = TRUE)
        testthat::expect_equal(
          object = colnames(x = out)[1:4],
          expected = c("est", "se", "z", "p")
        )
        testthat::expect_equal(
          object = unname(obj = out[, "97.5%"]),
          expected = c(1, 2) + stats::qnorm(p = 0.975) * c(0.5, 1)
        )
        testthat::expect_equal(
          object = ncol(
            x = wald:::.CIWald(
              est = 1,
              se = 1,
              df = 10,
              test = TRUE
            )
          ),
          expected = 5
        )
      }
    )
  },
  text = "test-wald-ci-wald-dot"
)
