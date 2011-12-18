#!/usr/bin/perl
use 5.012;
use warnings;

my @nums = reverse '100' .. '999';

sub is_well {
    my $num = shift;
    foreach my $x (@nums) {
        if ($num % $x == 0 && $num/$x < 1000) {
            return 1;
        }
    }
    return 0;
}

foreach my $x (@nums) {
    my $ans = $x . reverse $x;
    if (is_well($ans)) {
        say $ans;
        last;
    }
}
