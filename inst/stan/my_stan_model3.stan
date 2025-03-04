data {
  int<lower=1> K;               // number of dose groups
  array[K] real dose;           // dose values
  array[K] int y;               // number of toxicities at dose group k
  array[K] int n;               // total mice at dose group k
  
  real prior_alpha_mu;
  real<lower=0> prior_alpha_sd;
  real prior_beta_mu;
  real<lower=0> prior_beta_sd;
}
parameters {
  real alpha;
  real beta;
}
model {
  // Priors
  alpha ~ normal(prior_alpha_mu, prior_alpha_sd);
  beta  ~ normal(prior_beta_mu,  prior_beta_sd);
  
  // Binomial likelihood
  for (k in 1:K){
    real p = inv_logit(alpha + beta * dose[k]);
    y[k] ~ binomial(n[k], p);
  }
}

