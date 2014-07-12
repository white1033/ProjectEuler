package main

import (
	"container/heap"
	"fmt"
	"io/ioutil"
	"strconv"
	"strings"
)

const size int = 80

func main() {
	pq := &PriorityQueue{nil, get_input("../matrix.txt")}
	seen := make(map[Item]bool)
	heap.Init(pq)

	start := Item{0, 0}
	heap.Push(pq, start)
	seen[start] = true

	for pq.Len() > 0 {
		e := heap.Pop(pq).(Item)
		for _, n := range neighbors(pq, e) {
			if !seen[n] {
				*at(pq.matrix, n) += *at(pq.matrix, e)
				seen[n] = true
				heap.Push(pq, n)
			}
		}
	}
	fmt.Println(pq.matrix[size-1][size-1])
}

func get_input(filename string) [][]int {
	input, _ := ioutil.ReadFile(filename)
	output := make([][]int, size)
	lines := strings.Split(string(input), "\r\n")
	for i, line := range lines {
		if len(line) == 0 {
			continue
		}
		nums := strings.Split(line, ",")
		part_output := make([]int, size)
		for j, num := range nums {
			part_output[j], _ = strconv.Atoi(num)
		}
		output[i] = part_output
	}
	return output
}

func neighbors(pq *PriorityQueue, e Item) (ret []Item) {
	ret = make([]Item, 0, 4)
	if e.i > 0 {
		ret = append(ret, Item{e.i - 1, e.j})
	}
	if e.j > 0 {
		ret = append(ret, Item{e.i, e.j - 1})
	}
	if e.i < len(pq.matrix)-1 {
		ret = append(ret, Item{e.i + 1, e.j})
	}
	if e.j < len(pq.matrix)-1 {
		ret = append(ret, Item{e.i, e.j + 1})
	}
	return
}

type Item struct {
	i, j int
}

type PriorityQueue struct {
	Items  []Item
	matrix [][]int
}

func at(matrix [][]int, pos Item) *int { return &matrix[pos.i][pos.j] }

func (pq PriorityQueue) Len() int { return len(pq.Items) }

func (pq PriorityQueue) Less(i, j int) bool {
	return *at(pq.matrix, pq.Items[i]) < *at(pq.matrix, pq.Items[j])
}

func (pq PriorityQueue) Swap(i, j int) { pq.Items[i], pq.Items[j] = pq.Items[j], pq.Items[i] }

func (pq *PriorityQueue) Push(x interface{}) { pq.Items = append(pq.Items, x.(Item)) }

func (pq *PriorityQueue) Pop() (ret interface{}) {
	n := len(pq.Items)
	ret = pq.Items[n-1]
	pq.Items = pq.Items[0 : n-1]
	return
}
