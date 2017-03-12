package main

/*
gap == 1の場合が、insert sort
分割したinsert sortというだけ

なので最終的には、gap == 1でソートされる
*/

import "fmt"

type ShellSort []int

func (x ShellSort) swap(a, b int) {
	x[a], x[b] = x[b], x[a]
}

// MEMO:
func (x ShellSort) Sort() {
	for gap := len(x) / 2; gap >= 1; gap /= 2 {
		for i := 0; i < len(x); i++ {
			for j := i; j-gap >= 0 && x[j-gap] > x[j]; j -= gap {
				x.swap(j-gap, j)
			}
		}
	}
}

func main() {
	var x ShellSort = ShellSort{0,1,2,3,4,5,6,7,8,9,6,5,4,3,6,5,4,3,10,9,8,7,6,5,4,3,2,1,0}
	x.Sort()
	fmt.Println(x)
}
