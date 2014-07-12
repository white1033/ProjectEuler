package main

import (
    "fmt"
)

const SIZE = 1e7

func main() {
    n := [SIZE + 1]int{1}
    for i := 2; i < SIZE+1; i++ {
        for j := i; j < SIZE+1; j += i {
            n[j] += 1
        }
    }

    ans := 0
    for i := 1; i < SIZE; i++ {
        if n[i] == n[i+1] {
            ans++
        }
    }
    fmt.Printf("%d\n", ans)
}
