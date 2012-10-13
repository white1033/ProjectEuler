#!/usr/bin/env perl
use v5.14;
use warnings;
use List::Util qw(sum);

my %func = (
    '3' => sub { $_[0] * ( $_[0] + 1 ) / 2 },
    '4' => sub { $_[0] * $_[0] },
    '5' => sub { $_[0] * ( 3 * $_[0] - 1 ) / 2 },
    '6' => sub { $_[0] * ( 2 * $_[0] - 1 ) },
    '7' => sub { $_[0] * ( 5 * $_[0] - 3 ) / 2 },
    '8' => sub { $_[0] * ( 3 * $_[0] - 2 ) }
);

my ( $n, $num, %nums, @type8 );
while (1) {
    $n++;
    foreach my $x ( reverse 3 .. 8 ) {
        $num = $func{$x}->($n);
        if ( $num ~~ [ 1000 .. 9999 ] ) {
            if ( $x == 8 ) {
                push @type8, $num;
            }
            else {
                push @{ $nums{ substr( $num, 0, 2 ) } }, [ $num, $x ];
            }
        }
    }
    last if $num > 9999;
}
solve( ['8'], [$_] ) foreach @type8;

sub solve {
    my ( $types, $num_set ) = @_;

    if ( @$types == 6 ) {
        if ( substr( $num_set->[0], 0, 2 ) eq substr( $num_set->[-1], -2 ) ) {
            say sum(@$num_set);
        }
    }
    else {
        foreach my $n ( @{ $nums{ substr( $num_set->[-1], -2 ) } } ) {
            unless ( $n->[1] ~~ @$types ) {
                solve( [ @$types, $n->[1] ], [ @$num_set, $n->[0] ] );
            }
        }
    }
}
