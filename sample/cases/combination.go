package main

import "fmt"

// MEMO: :Q:異なるn個からr個取り出す組み合わせ(nCr)
func comb(A []int, N int) [][]int {
	var dfs func(int, int, []int) [][]int
	dfs = func(i, n int, acc []int) [][]int {
		if n == 0 {
			return [][]int{acc}
		} else if i == len(A) {
			return [][]int{}
		} else {
			var a [][]int
            // appendは破壊的な操作にならない
			a = append(a, dfs(i+1, n-1, append(acc, A[i]))...)
			a = append(a, dfs(i+1, n, acc)...)
			return a
		}
	}
	return dfs(0, N, []int{})
}

func main() {
	fmt.Println(comb([]int{1, 2, 3, 4}, 2))  // [[1 2] [1 3] [1 4] [2 3] [2 4] [3 4]]
}