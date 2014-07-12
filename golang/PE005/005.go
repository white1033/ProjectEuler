// What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?

package main

import "fmt"

func GCD(x, y int) int {
	for y != 0 {
		x, y = y, x%y
	}
	return x
}

func LCM(x, y int) int {
	return x * y / GCD(x, y)
}

func main() {
	ans := 1
	for i := 11; i < 21; i++ {
		ans = LCM(ans, i)
	}
	fmt.Printf("%d\n", ans)
}
