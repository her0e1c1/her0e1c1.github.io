// 異なるn個のn個以下の組み合わせ
package main

import "fmt"

func allSubsets(A []int) [][]int {
	var dfs func(int) [][]int
	dfs = func(i int) [][]int {
		if i == len(A) {
			return [][]int{{}}
		} else {
			var a [][]int
			for _, b := range dfs(i + 1) {
				a = append(a, b)
				a = append(a, append([]int{A[i]}, b...))
			}
			return a
		}
	}
	return dfs(0)
}

func main() {
	fmt.Println(allSubsets([]int{1, 2, 3}))
	fmt.Println(allSubsets([]int{1, 2, 3, 4, 5}))
}
