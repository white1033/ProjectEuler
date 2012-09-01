#!/usr/bin/perl
use strict;

my %cache = ( 1 => 1 );

sub chain_lenth {
    my $n = shift;
    if ( not defined $cache{$n} ) {
        $cache{$n} = chain_lenth( $n % 2 ? 3 * $n + 1 : $n / 2 ) + 1;
    }
    return $cache{$n};
}

my @max = ( 0, 0 );
my $lim = 1_000_000;

foreach my $x ( 3 .. $lim ) {
    next if !( $x % 2 );
    my $len = chain_lenth($x);
    @max = ( $x, $len ) if $len > $max[1];
}
print $max[0]
