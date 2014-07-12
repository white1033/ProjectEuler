package main

import (
	"fmt"
	"math/big"
)

func main() {
	result, target := 0, big.NewInt(1e6)
	for i := 100; i >= 0; i-- {
		if (new(big.Int)).Binomial(int64(i), int64(i/2)).Cmp(target) == -1 {
			break
		}
		tmp := 0
		for j := i / 2; j >= 0; j-- {
			if (new(big.Int)).Binomial(int64(i), int64(j)).Cmp(target) == 1 {
				tmp++
			} else {
				break
			}
		}
		result += tmp*2 + ((i % 2) - 1)
	}
	fmt.Println(result)
}
