package main

import (
	"fmt"
	"math"
)

func is_square(num int32) bool {
	root := int32(math.Sqrt(float64(num)))
	return root*root == num
}

func main() {
	var a, b, c, d, e, f int32
	solved := false
	result := int32(0)

	for i := int32(4); !solved; i++ {
		a = i * i
		for j := int32(3); j < i && !solved; j++ {
			c = j * j
			f = a - c
			if f <= 0 || !is_square(f) {
				continue
			}
			var kstart int32
			if j%2 == 1 {
				kstart = 1
			} else {
				kstart = 2
			}
			for k := kstart; k < j; k += 2 {
				d = k * k
				e = a - d
				b = c - e
				if b <= 0 || e <= 0 || !is_square(b) || !is_square(e) {
					continue
				}

				x, y, z := (d+c)/2, (e+f)/2, (c-d)/2
				result = x + y + z
				solved = true
				break
			}
		}
	}
	fmt.Println(result)
}
