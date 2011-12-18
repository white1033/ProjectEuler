#!/usr/bin/perl
use v5.12;
use warnings;
use List::Util qw{sum};

say abs(sum(map {$_**2} 1 .. 100) - (sum 1 .. 100)**2);
