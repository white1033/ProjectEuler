package main

import (
	"fmt"
	"github.com/cznic/mathutil"
)

const (
	LIMIT = 10000000000
)

func Solve() uint64 {
	var prime, idx uint64 = 2, 1
	var ans uint64 = 0

	for !(ans > LIMIT && idx%2 == 1) {
		prime, _ = mathutil.NextPrimeUint64(prime)
		idx += 1
		ans = 2 * prime * idx
	}
	return idx
}

func main() {
	fmt.Println(Solve())
}
