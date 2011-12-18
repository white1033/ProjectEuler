#!/usr/bin/perl
use 5.012;
use warnings;

my $target = 600851475143;
my $factor = 1;

while ($target != 1) {
    $factor += 2;
    while ($target % $factor == 0) {
        $target /= $factor;
    }
}
say $factor;
