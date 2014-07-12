// We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.
//
// What is the largest n-digit pandigital prime that exists?

package main

import (
	"fmt"
	"github.com/cznic/mathutil"
)

type Uint64s []uint64

func (p Uint64s) Len() int           { return len(p) }
func (p Uint64s) Less(i, j int) bool { return p[i] > p[j] }
func (p Uint64s) Swap(i, j int)      { p[i], p[j] = p[j], p[i] }

func main() {
	ary := Uint64s{7, 6, 5, 4, 3, 2, 1}
	var num uint64
	for mathutil.PermutationNext(ary) {
		num = 0
		for _, v := range ary {
			num = 10*num + v
		}
		if mathutil.IsPrimeUint64(num) {
			fmt.Println(num)
			break
		}
	}
}
