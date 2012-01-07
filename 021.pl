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

sub sum_of_proper_divisors {
    my $num = shift;
    return sum_of_divisors($num) - $num
}

my $sum;
my $tmp;
foreach my $num (2 .. 10_000) {
    $tmp = sum_of_proper_divisors($num);
    if ($tmp != $num && sum_of_proper_divisors($tmp) == $num) {
        $sum += $num;
    }
}
say $sum;
