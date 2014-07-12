// Package main provides ...
package main

import (
	"./sudoku"
	"fmt"
	"io/ioutil"
	"regexp"
	"strconv"
	"strings"
)

func main() {
	raw_data, _ := ioutil.ReadFile("../sudoku.txt")
	r := regexp.MustCompile(`Grid`)
	lines := strings.Split(string(raw_data), "\n")
	var grids string
	for _, line := range lines {
		if len(line) == 0 {
			continue
		}
		if !r.MatchString(line) {
			grids += line
		}
	}
	sum := 0
	for i := 0; i < len(grids); i += 81 {
		ans_grid := sudoku.Solve(grids[i : i+81])
		tmp := fmt.Sprintf("%s%s%s", ans_grid["A1"], ans_grid["A2"], ans_grid["A3"])
		num, _ := strconv.Atoi(tmp)
		sum += num
	}
	fmt.Println(sum)
}
