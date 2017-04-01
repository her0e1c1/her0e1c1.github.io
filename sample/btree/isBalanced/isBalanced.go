// check the tree is balanced (balanced means any two leaf have the same length form root)
package main

import "fmt"
import . "../../btree"

func min(a, b int) int {
	if a <= b {
		return a
	} else {
		return b
	}
}

func max(a, b int) int {
	if a >= b {
		return a
	} else {
		return b
	}
}

// 最大と最小の深さが等しければ、balancedとみなす
func isBalanced(n *Node) bool {
	return maxDepth(n)-minDepth(n) == 0
}

func maxDepth(n *Node) int {
	if n == nil {
		return 0
	}
	return 1 + max(maxDepth(n.Left), maxDepth(n.Right))
}

func minDepth(n *Node) int {
	if n == nil {
		return 0
	}
	return 1 + min(maxDepth(n.Left), maxDepth(n.Right))
}

func main() {
	fmt.Println(isBalanced(FromSlice([]int{0, 1, 2, 3, 4, 5})))
	fmt.Println(isBalanced(FromSlice([]int{0, 1, 2, 3, 4, 5, 6, 7})))
}
