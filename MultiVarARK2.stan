data {
  int<lower=0> K;  // Order of Autoregression
  int<lower=0> N; // number of observations
  real y[N];   // Outcome
  real x1[N]; // Input variable 1
  real x2[N]; // Input variable 2

}
parameters {
  real alpha;
  real beta[K];
  real c[K];
  real d[K];
  real sigma;
}
model {
  for (n in (K+1):N) {
    real mu = alpha;
    for (k in 1:K)
      mu += beta[k] * y[n-k] + c[K]*x1[n-k] + d[K]*x2[n-k];
      y[n] ~ normal(mu, sigma);
  }
}

