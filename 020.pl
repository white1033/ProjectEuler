#!/usr/bin/perl
use v5.12;
use warnings;
use List::Util qw{sum};
use Math::BigInt;

my $ans = Math::BigInt->new(1);
foreach (2 .. 100) { $ans *= $_ }
say sum split //, $ans;
