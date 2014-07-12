// Find the sum of all the multiples of 3 or 5 below 1000.

package main

import "fmt"

func Solve(n, m int) int {
	return (n + m/n*n) * (m / n) / 2
}

func main() {
	fmt.Println(Solve(3, 1000) + Solve(5, 1000) - Solve(15, 1000))
}
