// What is the largest prime factor of the number 600851475143 ?

package main

import "fmt"

func main() {
	n := 600851475143
	m := 1
	for n != 1 {
		m += 2
		for n%m == 0 {
			n /= m
		}
	}
	fmt.Println(m)
}
