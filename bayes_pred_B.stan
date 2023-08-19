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

// The input data is an int 'correct' which tells us how many correct the 
// person guesses out of 100.
data {
  int<lower=0> N;
  int<lower=0> esp[N];
}

// The parameters accepted by the model. Our model
// accepts one parameter 'p' indicating the probability of a 
// correct guess for any given card
parameters {
  real<lower=0,upper=1> p;
}

// The model to be estimated. We model the output
// 'correct' to follow a binomial distribution with probability p
// and n = 100.
model {
  p ~ normal(0.2, 0.025);
  esp ~ bernoulli(p);
}

