#!/usr/bin/env perl
use v5.12;
use warnings;
use List::Util qw(sum);

sub to_1or89 {
    my $x = shift;
    while ( $x != 89 && $x != 1 ) {
        $x = sum( map { $_ * $_ } split //, $x );
    }
    return $x;
}

my %hash = ( 0 => 1 );
my @squares = ( 0, 1, 4, 9, 16, 25, 36, 49, 64, 81 );
foreach ( 0 .. 6 ) {
    my %tmp;
    while ( my ( $k, $v ) = each %hash ) {
        $tmp{ $k + $_ } += $v foreach @squares;
    }
    %hash = %tmp;
}

my %ans = ( 1 => 0, 89 => 0 );
delete $hash{0};
while ( my ( $k, $v ) = each %hash ) {
    $ans{ to_1or89($k) } += $v;
}
say $ans{89}
