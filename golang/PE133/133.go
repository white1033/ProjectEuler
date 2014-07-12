// Package main provides ...
package main

import (
	"fmt"
	"github.com/cznic/mathutil"
)

func main() {
	var prime uint64 = 5
	var n uint64 = 1e17
	var result uint64 = 5
	for prime < 100000 {
		if mathutil.ModPowUint64(10, n, 9*prime) != 1 {
			result += prime
		}
		prime, _ = mathutil.NextPrimeUint64(prime)
	}
	fmt.Println(result)
}
