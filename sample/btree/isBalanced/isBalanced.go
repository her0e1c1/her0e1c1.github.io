package main

import "fmt"
import . "../../btree"

// check the tree is balanced
// balanced means any two leaf have the same length form root

func min (a, b int) int {
	if a <= b {
		return a
	} else {
		return b
	}
}

// TODO: how to define?
func max (a, b int) int {
	if a >= b {
		return a
	} else {
		return b
	}
}

// NOTE: 別のパッケージから既存の構造体にメソッドを付与できない
// cannot define new methods on non-local type btree.Node

// MEMO:
func isBalanced(n *Node) bool {
	return maxDepth(n) - minDepth(n) == 0
}
func maxDepth(n *Node) int {
	if (n == nil) {
		return 0
	}
	return 1 + max(maxDepth(n.Left), maxDepth(n.Right))
}
func minDepth(n *Node) int {
	if (n == nil){
		return 0
	}
	return 1 + min(maxDepth(n.Left), maxDepth(n.Right))
}

func main() {
	fmt.Println(isBalanced(FromSlice([]int{0, 1, 2, 3, 4, 5})))
	fmt.Println(isBalanced(FromSlice([]int{0, 1, 2, 3, 4, 5, 6, 7})))
}
