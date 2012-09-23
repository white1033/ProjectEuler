#!/usr/bin/env perl
use v5.12;
use warnings;

sub binomial {
    use bigint;
    my ( $r, $n, $k ) = ( 1, @_ );
    $r = $r * ( $n + 1 - $_ ) / $_ foreach 1 .. $k;
    return $r;
}

my $n = 100;
say binomial( $n + 9, 9 ) - 1 + binomial( $n + 10, 10 ) - 101 - 9 * $n
