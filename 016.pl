#!/usr/bin/perl
use v5.12;
use warnings;
use bignum;

my $num = 2**1000;
my $sum;

foreach my $digit (split //, $num) {
    $sum += $digit;
}

say $sum;
