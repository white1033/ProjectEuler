// Package main provides ...
package main

import (
    "fmt"
    "github.com/cznic/mathutil"
)

func IsPrimitive(num, prime uint64) bool {
    tmp := prime - 1
    idx := uint64(2)
    for idx * idx <= tmp {
        if tmp % idx == 0 {
            if mathutil.ModPowUint64(num, idx, prime) == 1 || mathutil.ModPowUint64(num, tmp / idx, prime) == 1 {
                return false
            }
        }
        idx += 1
    }
    return true
}

func main() {
    for i := uint64(724709891); i < 729927007; i += 100000 {
        if mathutil.IsPrimeUint64(i) && IsPrimitive(10, i) {
            fmt.Println((i - 1) * 9 / 2)
        }
    }
}
