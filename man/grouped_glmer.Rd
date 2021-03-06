% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/grouped_glmer.R
\name{grouped_glmer}
\alias{grouped_glmer}
\title{Function to run generalized linear mixed-effects model (glmer) across multiple
grouping variables.}
\usage{
grouped_glmer(data, grouping.vars, formula, family = stats::binomial(link
  = "probit"), control = lme4::glmerControl(optimizer = "bobyqa",
  boundary.tol = 1e-07, calc.derivs = FALSE, use.last.params = FALSE,
  optCtrl = list(maxfun = 2e+09)), output = "tidy")
}
\arguments{
\item{data}{Dataframe from which variables are to be taken.}

\item{grouping.vars}{List of grouping variables.}

\item{formula}{a two-sided linear formula object describing both the
    fixed-effects and random-effects part of the model, with the response
    on the left of a \code{~} operator and the terms, separated by
    \code{+} operators, on the right.  Random-effects terms are
    distinguished by vertical bars (\code{"|"}) separating expressions
    for design matrices from grouping factors.}

\item{family}{a GLM family, see \code{\link[stats]{glm}} and
    \code{\link[stats]{family}}.}

\item{control}{a list (of correct class, resulting from
    \code{\link{lmerControl}()} or \code{\link{glmerControl}()}
    respectively) containing control parameters, including the nonlinear
    optimizer to be used and parameters to be passed through to the
    nonlinear optimizer, see the \code{*lmerControl} documentation for
    details.}

\item{output}{A character describing what output is expected. Two possible
options: \code{"tidy"} (default), which will return the results, or \code{"glance"},
which will return model summaries.}
}
\value{
A tibble dataframe with tidy results from linear model or model
summaries.
}
\description{
Function to run generalized linear mixed-effects model (glmer) across multiple
grouping variables.
}
\examples{

# commented out because the examples are time-consuming and the R CMD CHECK
# makes a NOTE (> 5s)

# categorical outcome; binomial family
groupedstats::grouped_glmer(
  formula = Survived ~ Age + (Age |
    Class),
  family = stats::binomial(link = "probit"),
  data = dplyr::sample_frac(groupedstats::Titanic_full, size = 0.3),
  grouping.vars = Sex
)

# continuous outcome; gaussian family
library(gapminder)

groupedstats::grouped_glmer(
  data = dplyr::sample_frac(gapminder, size = 0.3),
  formula = scale(lifeExp) ~ scale(gdpPercap) + (gdpPercap | continent),
  family = stats::gaussian(),
  control = lme4::lmerControl(
    optimizer = "bobyqa",
    restart_edge = TRUE,
    boundary.tol = 1e-7,
    calc.derivs = FALSE,
    optCtrl = list(maxfun = 2e9)
  ),
  grouping.vars = year,
  output = "tidy"
)
}
\seealso{
grouped_lmer
}
\author{
Indrajeet Patil
}
