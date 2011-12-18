#!/usr/bin/perl
use v5.12;
use warnings;

sub PPT_sum {
    my $target = shift;
    foreach my $x (grep { $_ % 2 } 1 .. sqrt $target) {
        foreach my $y (grep { !($_ % 2) } $x+1 .. sqrt $target) {
            my ($sa, $sb, $sc) = ($y**2 - $x**2, 2 * $x * $y, $x**2 + $y**2);
            return $sa * $sb * $sc if $sa + $sb + $sc == $target;
        }
    }
}

say PPT_sum(1000);
