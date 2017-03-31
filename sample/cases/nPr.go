// 異なるn個の中からr個並べる場合の数(nPr)
package main

import "fmt"

func nPr(A []int, r int) [][]int {
	a := [][]int{}
	var dfs func(n int)
	dfs = func(n int) {
        // fmt.Println(A)
		if n == r {
			b := make([]int, len(A))  // copyではサイズを前もって指定
			copy(b, A)
			a = append(a, b)
		} else {
			// n=0なら、左端に全ての要素をswap移動. n=1はそれ以外を移動...
			for i := n; i < len(A); i++ {
				// swapは破壊的 <=> appendは破壊的でない. ゆえに並列化しづらい???
				A[i], A[n] = A[n], A[i]
				dfs(n + 1)
				A[i], A[n] = A[n], A[i]
			}
		}
	}
	dfs(0)
	return a
}

func main() {
	fmt.Println(nPr([]int{1, 2, 3, 4, 5}, 2))
}
