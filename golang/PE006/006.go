// Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.

package main

import (
	"fmt"
)

func SumOfN(n int) int {
	return (n + 1) * n / 2
}

func SumOfSquares(n int) int {
	return n * (n + 1) * (2*n + 1) / 6
}

func main() {
	x := SumOfN(100)
	fmt.Printf("%d\n", x*x-SumOfSquares(100))
}
