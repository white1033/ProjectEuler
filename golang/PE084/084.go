package main

import (
	"fmt"
	"math/rand"
	"sort"
)

type Player struct {
	cPos, ccPos, chancePos int
}

func (p *Player) CC() {
	var cc = []int{0, 10}
	p.ccPos = (p.ccPos + 1) % 16

	if p.ccPos < 2 {
		p.cPos = cc[p.ccPos]
	}
}

func (p *Player) chance() {
	var chance = []int{0, 10, 11, 24, 39, 5}
	p.chancePos = (p.chancePos + 1) % 16

	if p.chancePos < 6 {
		p.cPos = chance[p.chancePos]
	}

	if p.chancePos == 6 || p.chancePos == 7 {
		switch p.cPos {
		case 7:
			p.cPos = 15
		case 22:
			p.cPos = 25
		case 36:
			p.cPos = 5
		}
	}

	if p.chancePos == 8 {
		if p.cPos == 22 {
			p.cPos = 28
		} else {
			p.cPos = 12
		}
	}

	if p.chancePos == 9 {
		p.cPos -= 3
	}
}

func main() {
	var board [40]int
	var samples int = 1000000
	player := new(Player)
	var doubles int = 0

	for i := 0; i < samples; i++ {

		var dice1 int = int(rand.Int31n(4) + 1)
		var dice2 int = int(rand.Int31n(4) + 1)

		if dice1 == dice2 {
			doubles++
		} else {
			doubles = 0
		}
		if doubles > 2 {
			player.cPos = 10
			doubles = 0
		} else {
			player.cPos = (player.cPos + dice1 + dice2) % 40

			if player.cPos == 7 || player.cPos == 22 || player.cPos == 36 {
				player.chance()
			}
			if player.cPos == 2 || player.cPos == 17 || player.cPos == 33 {
				player.CC()
			}
			if player.cPos == 30 {
				player.cPos = 10
			}
		}
		board[player.cPos]++
	}
	tmp := make(map[int]string)
	for k, v := range board {
		tmp[v] = fmt.Sprintf("%0d", k)
	}
	sort_board := sort.IntSlice(board[:])
	sort.Sort(sort.Reverse(sort_board))
	for i := 0; i < 3; i++ {
		fmt.Printf("%v", tmp[sort_board[i]])
	}
}
