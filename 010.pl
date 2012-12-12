#!/usr/bin/perl
use 5.014;
use warnings;
use List::Util qw(sum);
use Math::Prime::Util qw(primes);

say sum( @{ primes(2e6) } )
