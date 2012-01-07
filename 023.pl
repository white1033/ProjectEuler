#!/usr/bin/perl
use v5.12;
use warnings;

sub sum_of_divisors {
    my $num = shift;
    my ($prime, $sum, $tmp) = (2, 1);
    while ($prime**2 <= $num && $num > 1) {
        if (!($num % $prime)) {
            $tmp = $prime**2;
            $num /= $prime;
            while (!($num % $prime)) {
                $tmp *= $prime;
                $num /= $prime;
            }
            $sum *= $tmp - 1;
            $sum /= $prime - 1;
        }
        if ($prime == 2) { $prime = 3 }
        else { $prime += 2 }
    }
    if ($num > 1) { $sum *= $num + 1 }
    return $sum
}

my $limit = 20162;
my $sum;
my %abn;

foreach my $num (1 .. $limit) {
    if (sum_of_divisors($num) > 2 * $num) { ++$abn{$num} }
    foreach my $x (keys %abn) {
        if (($num - $x) ~~ %abn) {
            $sum += $num;
            last;
        }
    }
}
say (($limit + 1) * $limit / 2 - $sum);
