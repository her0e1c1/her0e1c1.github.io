// 2分木におけるsub treeのnodeの和がK
package main

import "fmt"
import . "../../btree"

func sumK(n *Node, k int) {
	var dfs func(*Node) int
	dfs = func(n *Node) int {
		if n == nil {
			return 0
		}
        v := n.Value + dfs(n.Left) + dfs(n.Right)
        if v == k {
            fmt.Println(n)
        }
		return v
	}
	dfs(n)
}

func main() {
    bt := FromSlice([]int{0, 1, 2, 3, 4, 5, 6})
    fmt.Println(bt)
	sumK(bt, 8)
}
