#!/usr/bin/perl
use 5.016;
use warnings;
use autodie;
use File::Slurp;
use List::Util qw( sum );

sub name_score {
    sum( map { ord($_) - 64 } split //, $_[0] );
}

my $ans;
my @sorted_names = sort map {m/\w+/g} read_file('words.txt');

while ( my ( $idx, $name ) = each @sorted_names ) {
    $ans += name_score($name) * ( $idx + 1 );
}
say $ans
