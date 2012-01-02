#!/usr/bin/perl
use v5.12;
use warnings;

my $today = 2; #1901/01/01 was Tuesday :p
my $total = 0;
my @days_in = (31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
foreach my $year (1901 .. 2000) {
    $days_in[1] = ($year % 4 == 0) ? 29 : 28;
    foreach my $month (0 .. 11) {
		$today += $days_in[$month];
		++$total if ($today % 7 == 0);
		$today %= 7;
	}
}
say $total;
