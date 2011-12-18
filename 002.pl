#!/usr/bin/perl
use 5.012;
use warnings;

my ($fib1, $fib2) = (1, 1);
my $sum;

while ($fib1 < 4_000_000) {
    if (!($fib1 % 2)) {
       $sum += $fib1;
    }
    ($fib1, $fib2) = ($fib2, $fib1 + $fib2);
}

say $sum;
