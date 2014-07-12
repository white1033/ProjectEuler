package main

import (
	"fmt"
	"github.com/cznic/mathutil"
)

func main() {
	n, num := 1, uint32(2*3*5*7)
	for n != 4 {
		num++
		if len(mathutil.FactorInt(num)) == 4 {
			n++
		} else {
			n = 0
		}
	}
	fmt.Println(num - 4 + 1)
}
