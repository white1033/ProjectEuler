#!/usr/bin/perl
use v5.12;
use warnings;

my @primes = (2, 3, 5);
my ($num, $sum, $magic) = (5, 10, 1);

while ($num < 2_000_000) {
    $num += 3 - $magic;
    $magic = -$magic;
    foreach my $prime (@primes) {
        if ($prime**2 > $num) {
            push @primes, $num;
            $sum += $num;
        }
        last if $num % $prime == 0;
    }
}

say $sum;
