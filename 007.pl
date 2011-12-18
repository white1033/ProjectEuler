#!/usr/bin/perl
use 5.012;
use warnings;

sub is_nextprime {
   my ($num, $primes_ref) = @_;
   foreach my $prime (@$primes_ref) {
      return 1 if $prime**2 > $num;
      return 0 if $num % $prime == 0;
   }
}

sub nth_prime {
   my ($target, $count) = (shift, 3);
   my @primes = (2, 3, 5);
   my $num = 5;
   return $primes[$target - 1] if $target < 3;
   while ($count < $target) {
      my $magic = 1;
      $num += 3 - $magic;
      $magic = -$magic;
      if (is_nextprime($num, \@primes)) {
         push @primes, $num;
         $count++;
      }
  }
   return $primes[-1];
}

say nth_prime(10001);
