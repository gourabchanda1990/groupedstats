% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/set_cwd.R
\name{set_cwd}
\alias{set_cwd}
\title{Setting Working Directory in RStudio to where the R Script is.}
\usage{
set_cwd()
}
\value{
Path to changed working directory.
}
\description{
This function will change the current working directory to
whichever directory the R script you are currently working on is located.
This preempts the trouble of setting the working directory manually.
}
\note{
This function will work \strong{only with RStudio IDE}. Reference:
https://eranraviv.com/r-tips-and-tricks-working-directory/
}
