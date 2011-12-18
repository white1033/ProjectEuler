#!/usr/bin/perl
use 5.012;
use warnings;

sub div_11_20 {
    my $divided = shift;
    foreach my $x (11 .. 20) {
        if ($divided % $x) {
            return 0;
        }
    }
    return 1;
}

my $count = 2520;
while (!div_11_20($count)) {
    $count += 2520;
}

say $count;
