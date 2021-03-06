library(testthat)
library(tsbox)

context("non standard cnames")

test_that("main functions work with non standard cnames", {

  x <- ts_tbl(ts_c(mdeaths, AirPassengers))
  x2 <- ts_tbl(ts_c(fdeaths, mdeaths))

  names(x) <- c("hey", "heyhey", "Hey")
  names(x2) <- c("hey", "heyhey", "Hey")

  expect_is(ts_span(x, start = 1958), "tbl_df")
  expect_is(ts_c(x, x2), "tbl_df")
  expect_is(ts_bind(x, x2), "tbl_df")
  expect_is(ts_scale(x), "tbl_df")
  expect_is(ts_frequency(x, "year"), "tbl_df")
  expect_is(ts_index(x2), "tbl_df")
  expect_is(ts_lag(x), "tbl_df")
  expect_is(ts_pick(x, 'mdeaths'), "tbl_df")

  skip_on_cran()
  expect_is(ts_plot(x), "call")

})
