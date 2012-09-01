#!/usr/bin/perl
use strict;
use warnings;
use Math::BigInt try => 'GMP';
use List::Util qw( sum );

my $num = Math::BigInt->new('100');
print sum( split //, $num->bfac() )
