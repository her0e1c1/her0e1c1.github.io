// 集合直積 (異なる要素を持つ集合から１つずつ選んだ場合の組み合わせ)
package main

import "fmt"

func cartesianProduct(A [][]int) [][]int {
	var dfs func(int) [][]int
	dfs = func(i int) [][]int {
		if i == len(A) {
			return [][]int{{}} // NO [][]int{}
		} else {
			var a [][]int
            for _, b := range A[i] {
                for _, c := range dfs(i+1) {
                    // a = append(a, append(c, b))
                    a = append(a, append([]int{b}, c...))
                }
            }
			return a
		}
	}
	return dfs(0)
}

func main() {
	fmt.Println(cartesianProduct([][]int{{1,2}, {3}, {4,5,6}}))
}
