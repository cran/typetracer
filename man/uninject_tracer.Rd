% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/tracer-inject.R
\name{uninject_tracer}
\alias{uninject_tracer}
\title{Remove parameter tracer from one function}
\usage{
uninject_tracer(f)
}
\arguments{
\item{f}{A function (that is, an object of class "function", and not a
character string).}
}
\value{
Logical value indicating whether or not tracer was able to be removed
("uninjected").
}
\description{
This function removes traces previous injected into functions with the
\link{inject_tracer} function.
}
\examples{
f <- function (x, y, z, ...) {
    x * x + y * y
}
inject_tracer (f)
val <- f (1:2, 3:4 + 0., a = "blah")
x <- load_traces ()

# Traces should always be "uninjected":
uninject_tracer (f)
# Traces may also be removed:
clear_traces ()
}
