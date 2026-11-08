## ---- test-wald-wald
lapply(
  X = 1,
  FUN = function(i,
                 text,
                 tol) {
    testthat::skip_on_cran()
    message(text)
    model <- stats::lm(
      formula = mpg ~ disp + carb + hp + cyl,
      data = datasets::mtcars
    )
    est <- stats::coef(object = model)
    var_est <- stats::vcov(object = model)
    theta <- rep(x = 0, times = 5)
    out <- Wald(
      est = est,
      var_est = var_est,
      theta = theta
    )
    testthat::test_that(
      desc = paste(text, "chisq"),
      code = {
        testthat::expect_true(
          object = all(abs(x = out["chisq"] - 1561.3) <= tol)
        )
      }
    )
    testthat::test_that(
      desc = paste(text, "df"),
      code = {
        testthat::expect_true(
          object = all(abs(x = out["df"] - 5) <= tol)
        )
      }
    )
    testthat::test_that(
      desc = paste(text, "p"),
      code = {
        testthat::expect_true(
          object = all(abs(x = out["p"] - 0.0) <= tol)
        )
      }
    )
    out <- Wald(
      est = est,
      var_est = var_est,
      theta = NULL
    )
    testthat::test_that(
      desc = paste(text, "chisq", "theta = NULL"),
      code = {
        testthat::expect_true(
          object = all(abs(x = out["chisq"] - 1561.3) <= tol)
        )
      }
    )
    testthat::test_that(
      desc = paste(text, "df", "theta = NULL"),
      code = {
        testthat::expect_true(
          object = all(abs(x = out["df"] - 5) <= tol)
        )
      }
    )
    testthat::test_that(
      desc = paste(text, "p", "theta = NULL"),
      code = {
        testthat::expect_true(
          object = all(abs(x = out["p"] - 0.0) <= tol)
        )
      }
    )
  },
  text = "test-wald-wald",
  tol = 0.05
)
