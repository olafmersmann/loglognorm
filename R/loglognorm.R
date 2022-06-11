##
## loglognorm.R - Interface to loglognorm.c
##
## Authors:
##  Heike Trautmann  <trautmann@statistik.uni-dortmund.de>
##  Detlef Steuer    <detlef.steuer@hsu-hamburg.de>
##  Olaf Mersmann    <olafm@p-value.net>
##

dloglognorm <- function(x, mean=0, sd=1)
  .Call(do_dloglognorm, x, mean, sd)

ploglognorm <- function(q, mean=0, sd=1)
  .Call(do_ploglognorm, q, mean, sd)

qloglognorm <- function(p, mean=0, sd=1)
  .Call(do_qloglognorm, p, mean, sd)

## FIXME: Faster way?
rloglognorm <- function(n, mean=0, sd=1)
  .Call(do_qloglognorm, runif(n), mean=mean, sd=sd)

mloglognorm <- function(moment, mean, sd)
  .Call(do_mloglognorm, moment,  mean, sd)

eloglognorm <- function(mean, sd)
  .Call(do_mloglognorm, 1, mean, sd)

vloglognorm <- function(mean, sd) {
  m1 <- mloglognorm(1, mean, sd)
  m2 <- mloglognorm(2, mean, sd)
  return (m2 - m1^2)
}

