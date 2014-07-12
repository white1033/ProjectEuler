package main

import (
	"fmt"
)

const (
	TARGET = 1000
	LIMIT  = 32 //sqrt(1000)
)

func main() {
	for i := 1; i < LIMIT; i += 2 {
		for j := i + 1; j < LIMIT; j += 2 {
			a, b, c := j*j-i*i, 2*i*j, i*i+j*j
			if a+b+c == TARGET {
				fmt.Printf("%d\n", a*b*c)
				break
			}
		}
	}
}
