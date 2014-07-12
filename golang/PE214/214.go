// Package main provides ...
package main

import (
    "fmt"
)

const (
    LIM = 4e7
    LEN = 25
)

func main() {
    var (
        phi [LIM]int
        chain [LIM]int
    )
    sum := uint64(0)
    chain[1] = 1

    for i := 0; i < LIM; i++ {
        phi[i] = i
    }

    for i := 2; i < LIM; i++ {
        if phi[i] != i {
            chain[i] = chain[phi[i]] + 1
            continue
        }
        phi[i]--;
        chain[i] = chain[i-1] + 1
        if chain[i] == LEN {
            sum += uint64(i)
        }
        for j := 2*i; j < LIM; j += i {
            phi[j] -= phi[j] / i
        }
    }

    fmt.Println(sum)
}
