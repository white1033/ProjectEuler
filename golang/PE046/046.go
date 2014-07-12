// It was proposed by Christian Goldbach that every odd composite number can be written as the sum of a prime and twice a square.
//
// 9 = 7 + 2×12
// 15 = 7 + 2×22
// 21 = 3 + 2×32
// 25 = 7 + 2×32
// 27 = 19 + 2×22
// 33 = 31 + 2×12
//
// It turns out that the conjecture was false.
//
// What is the smallest odd composite that cannot be written as the sum of a prime and twice a square?

package main

import (
	"fmt"
	"github.com/cznic/mathutil"
)

var primes = make(map[uint32]bool)

func IsPrime(n uint32) bool {
	for p, _ := range primes {
		if n%p == 0 {
			return false
		}
	}
	return true
}

func IsGoldbach(n uint32) bool {
	bound := mathutil.ISqrt(n/2) + 1
	for i := uint32(1); i < bound; i++ {
		if _, ok := primes[n-2*i*i]; ok {
			return true
		}
	}
	return false
}

func main() {
	var n, d uint32 = 5, 4
	for {
		if IsPrime(n) {
			primes[n] = true
		} else if !IsGoldbach(n) {
			fmt.Printf("%d\n", n)
			break
		}
		if d == 4 {
			d = 2
		} else {
			d = 4
		}
		n += d
	}
}
