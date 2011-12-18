#!/usr/bin/perl
use v5.12;
use warnings;
use List::Util qw{sum};

my @ans = grep { !($_ % 3) || !($_ % 5) } 1 .. 999;
say sum @ans;
