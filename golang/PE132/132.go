// Package main provides ...
package main

import (
	"fmt"
	"github.com/cznic/mathutil"
)

func main() {
	var prime uint64 = 7
	var n uint64 = 1e9
	var count int = 0
	var result uint64 = 0
	for count < 40 {
		if mathutil.ModPowUint64(10, n, 9*prime) == 1 {
			count += 1
			result += prime
		}
		prime, _ = mathutil.NextPrimeUint64(prime)
	}
	fmt.Println(result)
}
