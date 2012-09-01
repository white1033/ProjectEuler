#!/usr/bin/perl
use strict;
use warnings;
use Math::BigInt;
use List::Util qw( sum );

print sum( split //, Math::BigInt->new('2')->bpow('1000') )
