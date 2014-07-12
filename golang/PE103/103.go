package main

import (
	"fmt"
)

// func Solve() string {
// 	nums := [7]int{20, 31, 38, 39, 40, 42, 45}
// 	var min, max int = -3, 3
// 	var ans string

// 	return ans
// }

// func MakeSubsetSums(nums []int) []int {
// 	var numset []int

// 	for i := 0; i < int(math.Pow(2, float64(len(nums)))); i++ {
// 		numset = append(numset, MakeSubsetSum(nums, i))
// 	}
// 	return numset
// }

func MakeSubsetSum(nums []int, n int) int {
	sum := 0
	for i := 0; i < len(nums); i++ {
		if (n & 1) == 1 {
			sum += nums[i]
		}
		n >>= 1
	}
	return sum
}

func main() {
	for i := 0; i < 4; i++ {
		fmt.Println(MakeSubsetSum([]int{1, 7}, i))
	}
}
