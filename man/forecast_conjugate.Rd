% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/bvar_conjugate.R
\name{forecast_conjugate}
\alias{forecast_conjugate}
\title{predict with conjugate Normal-Inverse-Wishart bayesian VAR model}
\usage{
forecast_conjugate(model, Y_in = NULL, Z_f = NULL, output = c("long",
  "wide"), h = 1, out_of_sample = TRUE, type = c("prediction",
  "credible"), level = c(80, 95), include = c("mean", "median", "sd",
  "interval", "raw"), fast_forecast = FALSE, verbose = FALSE)
}
\arguments{
\item{model}{estimated conjugate N-IW model}

\item{Y_in}{(NULL by default) past values of endogeneous variables (shold have at least p observations).
If NULL, then Y_in supplied for estimation will be used. For out-of-sample forecast only last p values of Y_in are used}

\item{Z_f}{future values of exogeneous variables}

\item{output}{(default 'long') --- long or wide table for mean/quantiles of forecasts}

\item{h}{number of periods for forecasting}

\item{out_of_sample}{logical, default is TRUE, whether forecasts are out-of-sample or in-sample.
If forecasts are not out-of-sample, then parameter h is ignored}

\item{type}{('prediction' by default) type of interval: 'prediction' incorporates uncertainty about
future shocks; 'credible' deals only with parameter uncertainty.}

\item{level}{confidence levels for prediction intervals}

\item{include}{(default is c('mean', 'median', 'sd', 'raw')) what type of summary to provide
If 'raw' is present raw forecasts will be reported. If only 'raw' is present
then function will return coda mcmc object with raw forecasts.
Otherwise raw forecasts will be attached as attribute.}

\item{fast_forecast}{logical, FALSE by default. If TRUE then only mean forecast is calculated,
posterior expected values of hyperparameters are used. No confidence intervals, no sd, no median.
This mode is activated by default if there are no simulations in supplied model.}

\item{verbose}{(default FALSE) if true some messages will be printed}
}
\value{
forecast results
}
\description{
predict with conjugate Normal-Inverse-Wishart bayesian VAR model
}
\details{
predict with conjugate Normal-Inverse-Wishart bayesian VAR model
}
\examples{
data(Yraw)
priors <- Carriero_priors(Yraw, p = 4)
model <- bvar_conjugate0(priors = priors, keep = 100)
forecast_conjugate(model, h = 2, output = 'wide')
forecast_conjugate(model, out_of_sample = FALSE, include = 'mean', level = NULL, type = 'credible')
}
