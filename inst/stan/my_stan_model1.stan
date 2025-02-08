
data {
  int<lower=0> N_drug;
  array[N_drug] real drug_x_data;

  int<lower=0> N_placebo;
  array[N_placebo] real placebo_data;

  real prior_mu_drug_mean;
  real<lower=0> prior_mu_drug_sd;
  real prior_mu_placebo_mean;
  real<lower=0> prior_mu_placebo_sd;
  real<lower=0> prior_sigma_scale;
}

parameters {
  real mu_drug;
  real mu_placebo;
  real<lower=0> sigma;
}

model {
  // Priors
  mu_drug ~ normal(prior_mu_drug_mean, prior_mu_drug_sd);
  mu_placebo ~ normal(prior_mu_placebo_mean, prior_mu_placebo_sd);
  sigma ~ cauchy(0, prior_sigma_scale);

  // Likelihood
  drug_x_data ~ normal(mu_drug, sigma);
  placebo_data ~ normal(mu_placebo, sigma);
}
