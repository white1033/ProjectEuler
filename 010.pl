#!/usr/bin/perl
use v5.12;
use warnings;

my @primes = (2, 3, 5);
my ($num, $sum, $magic) = (5, 10, 1);

#Again, use the fact that any primes greater than 3 must be type of 6n+1 or 6n-1
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
