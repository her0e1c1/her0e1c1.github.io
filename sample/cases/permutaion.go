// 異なるn個の中からr個並べる場合の数(nPr)
package main

import "fmt"

// n=0なら、左端に全ての要素をswap移動. n=1はそれ以外を移動...
func nPn(A []int) {
	var dfs func(int)
	dfs = func(n int) {
		if n == len(A) {
			fmt.Println(A)
		} else {
			for i := n; i < len(A); i++ {
				A[i], A[n] = A[n], A[i]
				dfs(n+1)
				A[i], A[n] = A[n], A[i] // swapは破壊的 <=> appendは破壊的でない
			}
		}
	}
	dfs(0)
}

func main() {
	nPn([]int{1, 2, 3}) // [1 2 3] [1 3 2] [2 1 3] [2 3 1] [3 2 1] [3 1 2]
}
