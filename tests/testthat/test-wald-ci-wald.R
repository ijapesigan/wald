## ---- test-wald-ci-wald
lapply(
  X = 1,
  FUN = function(i,
                 text,
                 n,
                 tol) {
    testthat::skip_on_cran()
    message(text)
    x <- data.frame(
      x1 = stats::rnorm(n = n),
      x2 = stats::rnorm(n = n),
      x3 = stats::rnorm(n = n)
    )
    x$y <- data.matrix(frame = x) %*% c(0.5, 0.25, 0) + stats::rnorm(n = n)
    lm_obj <- stats::lm(
      formula = y ~ .,
      data = x
    )
    lm_ci <- stats::confint(object = lm_obj)
    k <- ncol(x = x)
    student <- CIWald(
      est = stats::coef(object = lm_obj),
      se = sqrt(x = diag(x = stats::vcov(object = lm_obj))),
      alpha = 0.05,
      z = FALSE,
      df = n - k,
      test = FALSE
    )
    z <- CIWald(
      est = stats::coef(object = lm_obj),
      se = sqrt(x = diag(x = stats::vcov(object = lm_obj))),
      alpha = 0.05,
      z = TRUE,
      test = FALSE
    )
    testthat::test_that(
      desc = paste(text, "t"),
      code = {
        testthat::expect_true(
          object = all(abs(x = lm_ci[, 1] - student[, 6]) <= tol)
        )
        testthat::expect_true(
          object = all(abs(x = lm_ci[, 2] - student[, 7]) <= tol)
        )
      }
    )
    testthat::test_that(
      desc = paste(text, "z"),
      code = {
        testthat::expect_true(
          object = all(abs(x = lm_ci[, 1] - z[, 5]) <= tol)
        )
        testthat::expect_true(
          object = all(abs(x = lm_ci[, 2] - z[, 6]) <= tol)
        )
      }
    )
  },
  text = "test-wald-ci-wald-ci",
  n = 10^6,
  tol = 0.0001
)

lapply(
  X = 1,
  FUN = function(i,
                 text,
                 n,
                 tol) {
    testthat::skip_on_cran()
    message(text)
    x <- data.frame(
      x1 = stats::rnorm(n = n),
      x2 = stats::rnorm(n = n),
      x3 = stats::rnorm(n = n)
    )
    x$y <- data.matrix(frame = x) %*% c(0.5, 0.25, 0) + stats::rnorm(n = n)
    lm_obj <- stats::lm(
      formula = y ~ .,
      data = x
    )
    k <- ncol(x = x)
    student <- CIWald(
      est = stats::coef(object = lm_obj),
      se = sqrt(x = diag(x = stats::vcov(object = lm_obj))),
      alpha = 0.05,
      z = FALSE,
      df = n - k,
      test = TRUE
    )
    z <- CIWald(
      est = stats::coef(object = lm_obj),
      se = sqrt(x = diag(x = stats::vcov(object = lm_obj))),
      alpha = 0.05,
      z = TRUE,
      test = TRUE
    )
    lm_table <- summary(object = lm_obj)$coefficients
    testthat::test_that(
      desc = paste(text, "t"),
      code = {
        testthat::expect_true(
          object = all(abs(x = lm_table[, "t value"] - student[, "t"]) <= tol)
        )
        testthat::expect_true(
          object = all(abs(x = lm_table[, "Pr(>|t|)"] - student[, "p"]) <= tol)
        )
      }
    )
    testthat::test_that(
      desc = paste(text, "z"),
      code = {
        testthat::expect_true(
          object = all(abs(x = lm_table[, "t value"] - z[, "z"]) <= tol)
        )
        testthat::expect_true(
          object = all(abs(x = lm_table[, "Pr(>|t|)"] - z[, "p"]) <= tol)
        )
      }
    )
  },
  text = "test-wald-ci-wald-test",
  n = 10^6,
  tol = 0.0001
)

lapply(
  X = 1,
  FUN = function(i,
                 text,
                 n) {
    testthat::skip_on_cran()
    message(text)
    x <- data.frame(
      x1 = stats::rnorm(n = n),
      x2 = stats::rnorm(n = n),
      x3 = stats::rnorm(n = n)
    )
    x$y <- data.matrix(frame = x) %*% c(0.5, 0.25, 0) + stats::rnorm(n = n)
    lm_obj <- stats::lm(
      formula = y ~ .,
      data = x
    )
    k <- ncol(x = x)
    testthat::test_that(
      desc = text,
      code = {
        testthat::expect_error(
          object = CIWald(
            est = stats::coef(object = lm_obj),
            se = sqrt(x = diag(x = stats::vcov(object = lm_obj))),
            theta = rep(x = 0, times = k + 1),
            alpha = 0.05,
            z = FALSE,
            df = n - k,
            test = FALSE
          )
        )
      }
    )
  },
  text = "test-wald-ci-wald-error",
  n = 10^3
)
