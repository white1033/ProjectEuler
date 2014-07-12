package main

import (
	"fmt"
)

func gcd(a, b uint64) uint64 {
	for b != 0 {
		a, b = b, a%b
	}
	return a
}

func main() {
	var p, q uint64 = 1009, 3643
	var phi uint64 = (p - 1) * (q - 1)
	var sum uint64

	for e := uint64(3); e < phi; e += 2 {
		if e%3 == 0 {
			continue
		}

		if e%7 == 0 {
			continue
		}

		if e%607 == 0 {
			continue
		}

		if gcd(e-1, p-1) == 2 && gcd(e-1, q-1) == 2 {
			sum += e
		}
	}
	fmt.Println(sum)
}
