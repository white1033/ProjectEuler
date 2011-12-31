#!/usr/bin/perl
use v5.12;
#use warnings;
use Memoize;

memoize('chain');

sub chain {
    my $num = shift;
    if ($num == 1) {
        return 1
    }
    else {
        return chain($num % 2 ? 3 * $num + 1 : $num / 2) + 1
    }
}

my @max = (1, 1);
foreach my $x (2 .. 999_999) {
    if (chain($x) > $max[1]) { @max = ($x, chain($x)) }
}
say $max[0];
