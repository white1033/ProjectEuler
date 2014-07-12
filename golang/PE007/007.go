// What is the 10001st prime number?

package main

import (
	"fmt"
	"github.com/cznic/mathutil"
)

func main() {
	var n uint32 = 1
	for i := 0; i < 10001; i++ {
		n, _ = mathutil.NextPrime(n)
	}
	fmt.Printf("%d\n", n)
}
