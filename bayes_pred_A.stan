//
// This Stan program defines a simple model, with a
// vector of values 'y' modeled as normally distributed
// with mean 'mu' and standard deviation 'sigma'.
//
// Learn more about model development with Stan at:
//
//    http://mc-stan.org/users/interfaces/rstan.html
//    https://github.com/stan-dev/rstan/wiki/RStan-Getting-Started
//

// The input data is a vector 'accidents' of length 'N'.
data {
  int<lower=0> N;
  int<lower=0> ac[N];
  real m;
}

// The parameters accepted by the model. Our model
// accepts a single parameter 'lamb'
parameters {
  real<lower=0> lamb;
}

// The model to be estimated. We model the output
// 'accidents' to follow a Poisson distrubution with 
// parameter lamb, which itself is normally distributed
// with mean 3 and standard deviation 0.5
model {
  lamb ~ normal(m, 0.5);
  ac ~ poisson(lamb);
}

