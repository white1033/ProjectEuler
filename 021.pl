#!/usr/bin/perl
use v5.12;
use warnings;

sub sum_of_divisors {
    my $num = shift;
    my $sum = 1;
    foreach my $x (2 .. sqrt $num) {
        if ($num % $x == 0) {
            $sum += ($x + $num / $x);
        }
    }
    if ((sqrt $num) =~ /^[+-]?\d+$/) { #use regular expression to do is_integer 
        $sum -= sqrt $num;
    }
    return $sum
}

my $sum;
my $tmp;
foreach my $num (2 .. 10_000) {
    $tmp = sum_of_divisors($num);
    if ($tmp != $num && sum_of_divisors($tmp) == $num) {
        $sum += $num;
    }
}
say $sum;
