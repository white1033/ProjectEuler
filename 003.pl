#!/usr/bin/perl
use v5.12;
use warnings;

my $target = 600851475143;
my $factor = 1;

while ($target != 1) {
    $factor += 2;
    while (!($target % $factor)) {
        $target /= $factor;
    }
}
say $factor;
