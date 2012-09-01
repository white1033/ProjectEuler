#!/usr/bin/perl
use strict;
use warnings;
use List::Util qw{ sum };

print abs( sum( map { $_**2 } 1 .. 100 ) - ( sum 1 .. 100 )**2 );
