## ----setup, include=FALSE-----------------------------------------------------
knitr::opts_chunk$set (
    collapse = TRUE,
    warning = TRUE,
    message = TRUE,
    width = 120,
    comment = "#>",
    fig.retina = 2,
    fig.path = "README-"
)
options (repos = c (
    ropenscireviewtools = "https://mpadge.r-universe.dev",
    CRAN = "https://cloud.r-project.org"
))
library (typetracer)

## ----nse1---------------------------------------------------------------------
eval_x_late_NSE <- function (x, y) {
    y <- 10 * y
    eval (substitute (x))
}
inject_tracer (eval_x_late_NSE)
eval_x_late_NSE (y + 1, 2:3)
res <- load_traces ()
res$par_name
res$uneval
res$eval

## ----nse2---------------------------------------------------------------------
clear_traces () # clear all preceding traces
eval_x_late_standard <- function (x = y + 1, y, z = y ~ x) {
    y <- 10 * y
    x
}
inject_tracer (eval_x_late_standard)
eval_x_late_standard (, 2:3)
res <- load_traces ()
res$par_name
res$uneval
res$eval

## -----------------------------------------------------------------------------
res$formal

