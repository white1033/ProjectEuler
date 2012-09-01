#!/usr/bin/perl
use strict;
use warnings;
use List::Util 'sum';
use Math::Prime::FastSieve 'primes';

print sum( @{ primes(2e6) } )
