package main

import (
	"fmt"
	"github.com/cznic/mathutil"
)

func extend_gcd(a, b uint64) (int64, int64, uint64) {
	var x, lastx, y, lasty int64 = 0, 1, 1, 0
	var quotient int64
	for b != 0 {
		quotient = int64(a / b)
		a, b = b, a%b
		x, lastx = lastx-quotient*x, x
		y, lasty = lasty-quotient*y, y
	}
	return lastx, lasty, a
}

func digit_count(num uint64) uint64 {
	var length uint64 = 1
	for num != 0 {
		length *= 10
		num /= 10
	}
	return length
}

func solve_lc(p1, p2 uint64) int64 {
	a := digit_count(p1)
	b := p2 - p1
	n := p2
	r, _, _ := extend_gcd(a, n)
	x := r * int64(b) % int64(n)
	if x < 0 {
		x += int64(n)
	}
	return x*int64(a) + int64(p1)
}

func main() {
	var ans int64 = 0
	var p1, p2 uint64
	p1 = 5
	p2, _ = mathutil.NextPrimeUint64(p1)

	for p1 <= 1e6 {
		ans += solve_lc(p1, p2)
		p1 = p2
		p2, _ = mathutil.NextPrimeUint64(p1)
	}
	fmt.Println(ans)
}
