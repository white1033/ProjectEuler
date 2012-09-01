#!/usr/bin/perl
use strict;
use warnings;
use Date::Calc qw( Day_of_Week );

my $ans;
foreach my $y ( 1901 .. 2000 ) {
    foreach my $m ( 1 .. 12 ) {
        $ans++ if Day_of_Week( $y, $m, 1 ) == 7;
    }
}
print $ans
