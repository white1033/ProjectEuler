package main

import (
	"fmt"
	"github.com/cznic/mathutil"
	"sort"
)

var nums = sort.IntSlice{1, 2, 3, 4, 5, 6, 7, 8, 9}

func check_patition(startindex, prev int) int {
	var count int = 0
	for i := startindex; i < nums.Len(); i++ {
		var number int = 0
		for j := startindex; j <= i; j++ {
			number = number*10 + nums[j]
		}

		if number < prev {
			continue
		}

		if !mathutil.IsPrime(uint32(number)) {
			continue
		}

		if i == nums.Len()-1 {
			return count + 1
		}

		count += check_patition(i+1, number)
	}
	return count
}

func main() {
	count := 0
	for mathutil.PermutationNext(nums) {
		count += check_patition(0, 0)
	}
	fmt.Println(count)
}
