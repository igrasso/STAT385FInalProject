data {
  int<lower=0> K;  // Order of Autoregression
  int<lower=0> N; // number of observations
  real y[N];   // Outcome
  real x[N]; // Input variable 1

}
parameters {
  real alpha;
  real beta[K];
  real c;
  real sigma;
}
model {
  for (n in (K+1):N) {
    real mu = alpha;
    for (k in 1:K)
      mu += beta[k] * y[n-k];
      y[n] ~ normal(mu+c*x[n], sigma);
  }
}

