package main

import (
	"fmt"
)

func main() {
	var x, y, limit, result int64 = 2, 1, 1e9, 0
	for {
		a_times_3 := 2*x - 1
		area_times_3 := y * (x - 2)
		if a_times_3 > limit {
			break
		}
		if a_times_3 > 0 && area_times_3 > 0 && a_times_3%3 == 0 && area_times_3%3 == 0 {
			a := a_times_3 / 3
			result += 3*a + 1
		}
		a_times_3 = 2*x + 1
		area_times_3 = y * (x + 2)

		if a_times_3 > 0 && area_times_3 > 0 && a_times_3%3 == 0 && area_times_3%3 == 0 {
			a := a_times_3 / 3
			result += 3*a - 1
		}
		nextx, nexty := 2*x+3*y, 2*y+x
		x, y = nextx, nexty
	}
	fmt.Println(result)
}
