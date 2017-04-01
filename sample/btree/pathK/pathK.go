// 2分木における経路の和がK
package main

import "fmt"
import . "../../btree"

func pathK(n *Node, K int) {
	path := []int{}
	var dfs func(*Node)
	dfs = func(n *Node) {
		if n == nil {
			return
		}
		path = append(path, n.Value)
		for i := 0; i < len(path); i++ {
			s := 0
			for j := i; j < len(path); j++ {
				s += path[j]
			}
			if s == K {
				fmt.Println(path[i:])
			}
		}
		dfs(n.Left)
		dfs(n.Right)
		path = path[:len(path)-1] // 親に戻る時は子の経路を排除
	}
	dfs(n)
}

func main() {
    bt := FromSlice([]int{0, 1, 2, 3, 4, 5, 6})
    fmt.Println(bt)
	pathK(bt, 6)
}
