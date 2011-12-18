#!/usr/bin/perl
use 5.012;
use warnings;
use List::Util qw{sum};

my @ans = grep {!($_ % 3) || !($_ % 5)} 1 .. 999;
say sum @ans;
