#!/usr/bin/perl
use v5.12;
use warnings;
use List::Util 'sum';

sub name_score {
    my $name = shift;
    my @char = split //, $name;
    return sum(map { (ord $_) - (ord 'A') + 1} @char)
}

my $file_name = 'names.txt';
my @names;
open(my $fh, $file_name) || die "cannot open $file_name: $!";

while (<$fh>) {
    chomp;
    s/\w+/push @names, $&/eg;
}

@names = sort @names;
my $sum;
foreach my $x (0 .. $#names) {
    $sum += ($x + 1) * name_score($names[$x]);
}
say $sum;