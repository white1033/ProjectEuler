package main

import (
    "fmt"
    "math/big"
)

func is_consecutive_prime(n int64) bool {
    var ary = [6]int64{1, 3, 7, 9, 13, 27}
    var test [6]*big.Int
    for k, v := range ary {
        test[k] = big.NewInt(n*n + v)
    }
    for _, v := range test {
        if !v.ProbablyPrime(6) {
            return false
        }
    }
    return true
}

func main() {
    var i, ans int64
    for i = 10; i < 1e6; i += 10 {
        if i%3 == 0 {
            continue
        }
        if is_consecutive_prime(i) {
            ans += i
        }
    }
    fmt.Printf("%d\n", ans)
}
