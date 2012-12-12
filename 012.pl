#!/usr/bin/env perl
use 5.012;
use warnings;
use Math::Prime::Util qw(primes);

my $primes_ref       = primes(1000);
my $num              = 3;
my $num_of_div       = 2;
my $num_of_div_sofar = 0;

while ( $num_of_div_sofar <= 500 ) {
    $num++;
    my $next_num = $num;
    $next_num /= 2 unless $next_num % 2;
    my $tmp_num_of_div = 1;

    foreach my $prime (@$primes_ref) {
        if ( $prime**2 > $next_num ) {
            $tmp_num_of_div *= 2;
            last;
        }

        my $expon = 1;
        until ( $next_num % $prime ) {
            $expon++;
            $next_num /= $prime;
        }

        $tmp_num_of_div *= $expon if $expon > 1;
        last if $next_num == 1;
    }
    $num_of_div_sofar = $num_of_div * $tmp_num_of_div;
    $num_of_div       = $tmp_num_of_div;
}
say $num * ( $num - 1 ) / 2
