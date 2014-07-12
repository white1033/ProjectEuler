package main

import "fmt"

type Pair struct {
	x, y int
}

const NUMBER_LENGTH = 20

func solve(n int) map[Pair]int {
	ret := make(map[Pair]int)
	if n == 2 {
		for i := 0; i < 10; i++ {
			for j := 0; j < 10; j++ {
				if i > 0 && i+j <= 9 {
					ret[Pair{i, j}] = 1
				} else {
					ret[Pair{i, j}] = 0
				}
			}
		}
		return ret
	}
	for k, v := range solve(n - 1) {
		for i := 0; i < 10-k.x-k.y; i++ {
			ret[Pair{k.y, i}] += v
		}
	}
	return ret
}

func main() {
	var ans int
	for _, v := range solve(NUMBER_LENGTH) {
		ans += v
	}
	fmt.Printf("%d\n", ans)
}
