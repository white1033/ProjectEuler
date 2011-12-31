#!/usr/bin/perl
use v5.12;
use warnings;

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

my $num = 3;
my $num_of_div = 2; # number of divisors for a prime
my $target = 0;
my ($tmpnum, $tmpnum_of_div, $expon);
my @primes = primes_sieve(1000);

while ($target <= 500) {
    $num++;
    $tmpnum = $num;
    if (!($tmpnum % 2)) { $tmpnum /= 2; }
    $tmpnum_of_div = 1;
    foreach my $prime (@primes) {
        if ($prime**2 > $tmpnum) {
            $tmpnum_of_div *= 2;
            last;
        }
        $expon = 1;
        while (!($tmpnum % $prime)) {
            $expon++;
            $tmpnum /= $prime;
        }
        if ($expon > 1) { $tmpnum_of_div *= $expon; }
        last if $tmpnum == 1;
    }
    $target = $num_of_div * $tmpnum_of_div;
    $num_of_div = $tmpnum_of_div;
}
say $num * ($num - 1) / 2;
