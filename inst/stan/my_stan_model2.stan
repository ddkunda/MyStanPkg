data {
  int<lower=1> N;                // number of dose levels
  array[N] real dose;            // dose values
  array[N] real response;        // observed mean percent reduction
  real<lower=0> sigma;           // known SD (if not known, you can turn this into a parameter)

  // Prior parameters (means and SDs)
  real prior_E0_mu;
  real<lower=0> prior_E0_sd;

  real prior_Emax_mu;
  real<lower=0> prior_Emax_sd;

  real prior_EC50_mu;
  real<lower=0> prior_EC50_sd;

  real prior_h_mu;
  real<lower=0> prior_h_sd;
}
parameters {
  real E0;
  real Emax;
  real<lower=0> EC50;
  real<lower=0> h;
}
model {
  // Priors
  E0   ~ normal(prior_E0_mu,   prior_E0_sd);
  Emax ~ normal(prior_Emax_mu, prior_Emax_sd);
  EC50 ~ normal(prior_EC50_mu, prior_EC50_sd);
  h    ~ normal(prior_h_mu,    prior_h_sd);

  // Likelihood
  for (i in 1:N) {
    real mu_i = E0 + (Emax * pow(dose[i], h)) / (pow(EC50, h) + pow(dose[i], h));
    response[i] ~ normal(mu_i, sigma);
  }
}

