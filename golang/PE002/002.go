// By considering the terms in the Fibonacci sequence whose values do not exceed four million, find the sum of the even-valued terms.

package main

import "fmt"

func main() {
	i, j := 1, 1
	ans := 0
	for i < 4e6 {
		if i%2 == 0 {
			ans += i
		}
		i, j = j, i+j
	}
	fmt.Println(ans)
}
