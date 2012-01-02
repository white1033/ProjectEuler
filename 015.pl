#!/usr/bin/perl
use v5.12;
use warnings;

sub binomial {
    my ($n, $k) = @_;
    $k = $k > ($n - $k) ? ($n - $k) : $k;
    my $ans = 1;
    foreach my $x (0 .. ($k - 1)) {
        $ans *= ($n - $x) / ($x + 1);
    }
    return $ans
}

say binomial(40, 20);
