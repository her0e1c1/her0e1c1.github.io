// 異なるn個の中からr個並べる場合の数(nPn)
package main

import "fmt"
import "sync"

var wg sync.WaitGroup

func nPn(A []int) chan []int {
	out := make(chan []int)
	var dfs func(n int)
	dfs = func(n int) {
		if n == len(A) {
			out <- A
		} else {
			// n=0なら、左端に全ての要素をswap移動. n=1はそれ以外を移動...
			for i := n; i < len(A); i++ {
				A[i], A[n] = A[n], A[i]
				dfs(n + 1)
				// swapは破壊的 <=> appendは破壊的でない
				// ゆえに並列化しづらい
				A[i], A[n] = A[n], A[i]
			}
		}
	}
	dfs(0)
	return out
}

func main() {
	for out := range nPn([]int{1, 2, 3}) {
		fmt.Println(out) // [1 2 3] [1 3 2] [2 1 3] [2 3 1] [3 2 1] [3 1 2]
	}
    wg.Wait()
}
