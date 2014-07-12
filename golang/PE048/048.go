package main

import (
	"fmt"
	"github.com/cznic/mathutil"
)

func main() {
	var ans uint64
	for i := 1; i < 1001; i++ {
		ans += mathutil.ModPowUint64(uint64(i), uint64(i), 1e10)
	}
	fmt.Println(ans % 1e10)
}
