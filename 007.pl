#!/usr/bin/env perl
use 5.012;
use warnings;
use Math::Prime::Util qw(nth_prime);

say nth_prime(10001)
