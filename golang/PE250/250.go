package main

import (
	"fmt"
)

func powmod(base, exp, mod int) int {
	p, result := base%mod, 1
	for exp > 0 {
		if exp&1 == 1 {
			result = (result * p) % mod
		}
		p = (p * p) % mod
		exp >>= 1
	}
	return result
}

func main() {
	var ans [2][250]uint64
	var pow [250251]int
	var mod uint64 = 1e16
	var i, j int
	for i = 1; i <= 250250; i++ {
		pow[i] = powmod(i, i, 250)
	}
	ans[0][0] = 1
	for i = 1; i <= 250250; i++ {
		for j = 0; j < 250; j++ {
			ans[1][j] = (ans[0][j] + ans[0][(j+250-pow[i])%250]) % mod
		}
		for j = 0; j < 250; j++ {
			ans[0][j] = ans[1][j]
		}
	}
	fmt.Printf("%d\n", ans[0][0]-1)
}
