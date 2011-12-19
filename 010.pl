#!/usr/bin/perl
use v5.12;
use warnings;
use List::Util qw{sum};

#use the sieve of Eratosthenes
sub primes_sieve {
    #find all primes in [2, limit).
    my $limit = shift;

    #trivial case
    return () if $limit < 2;
    return (2) if $limit == 2;

    #only find primes in odd numbers
    my @sieve = grep { $_ % 2 } 3 .. $limit;
    my $check_limit = sqrt $limit;
    my ($num, $idx) = (3, 0);
    while ($num < $check_limit) {
        if ($sieve[$idx]) {
            my $tmp = ($num**2 - 3) / 2;
            $sieve[$tmp] = 0;
            while ($tmp < scalar @sieve) {
                $sieve[$tmp] = 0;
                $tmp += $num;
            }
        }
        $idx++;
        $num = 2 * $idx + 3;
    }
    return (2, grep { $_ } @sieve)
}

say sum(primes_sieve(2_000_000));
