// Package main provides ...
package main

import (
    "fmt"
)

func cycle_length(n uint64) uint64 {
    length, num := uint64(1), uint64(10)
    if n == 1 { return uint64(0) }
    if n % 2 == 0 { return cycle_length(n / 2) }
    if n % 5 == 0 { return cycle_length(n / 5) }
    for {
        if (num - 1) % n == 0 {
            break
        }
        length, num = length + 1, num * 10
    }
    return length
}

func main() {
    ans := uint64(0)
    for i := 3; i <= 1e6; i++ {
        ans += cycle_length(uint64(i))
    }
    fmt.Println(ans)
}
