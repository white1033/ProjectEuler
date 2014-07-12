package main

import (
	"fmt"
	"math"
)

func PE148(num int64) int64 {
	d7 := []int64{}
	for i := num; i > 0; i = i / 7 {
		d7 = append(d7, i%7)
	}

	ct, mul := int64(0), int64(1)
	for i := len(d7) - 1; i >= 0; i-- {
		ct += int64(math.Pow(28, float64(i))) * d7[i] * (d7[i] + 1) / 2 * mul
		mul *= (d7[i] + 1)
	}
	return ct
}

func main() {
	fmt.Println(PE148(1e9))
}
