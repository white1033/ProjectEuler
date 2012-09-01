#!/usr/bin/perl
use strict;
use warnings;

my @nums = reverse 100 .. 999;

sub good_num {
    my $num = shift;
    foreach my $x (@nums) {
        return 1 if $num % $x == 0 && $num / $x < 1000;
    }
    return 0;
}

foreach my $x (@nums) {
    my $ans = $x . reverse $x;
    print($ans), last if good_num($ans);
}
