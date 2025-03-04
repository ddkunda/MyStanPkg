#' Fit My Stan Model1
#'
#' This function runs MCMC via rstan::sampling on the precompiled Stan model.
#'
#' @param data A named list of data as expected by my_stan_model.stan
#' @param ... Other arguments passed to rstan::sampling (e.g. iter, chains)
#'
#' @return A stanfit object
#' @export
fit_my_stan_model1 <- function(data, ...) {
  # The compiled model is stored in:
  # MyStanPkg1:::stanmodels$my_stan_model
  mod <- MyStanPkg:::stanmodels$my_stan_model1

  # Run sampling
  fit <- rstan::sampling(mod, data = data, ...)
  return(fit)
}


#' Fit My Stan Model2
#'
#' This function runs MCMC via rstan::sampling on the precompiled Stan model.
#'
#' @param data A named list of data as expected by my_stan_model.stan
#' @param ... Other arguments passed to rstan::sampling (e.g. iter, chains)
#'
#' @return A stanfit object
#' @export
fit_my_stan_model2 <- function(data, ...) {
  # The compiled model is stored in:
  # MyStanPkg1:::stanmodels$my_stan_model
  mod <- MyStanPkg:::stanmodels$my_stan_model2

  # Run sampling
  fit <- rstan::sampling(mod, data = data, ...)
  return(fit)
}


#' Fit My Stan Model3
#'
#' This function runs MCMC via rstan::sampling on the precompiled Stan model.
#'
#' @param data A named list of data as expected by my_stan_model.stan
#' @param ... Other arguments passed to rstan::sampling (e.g. iter, chains)
#'
#' @return A stanfit object
#' @export
fit_my_stan_model3 <- function(data, ...) {
  # The compiled model is stored in:
  # MyStanPkg1:::stanmodels$my_stan_model
  mod <- MyStanPkg:::stanmodels$my_stan_model3

  # Run sampling
  fit <- rstan::sampling(mod, data = data, ...)
  return(fit)
}
