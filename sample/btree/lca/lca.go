// Lowest Common Ancestor (ORDER=O(log(n)^2))
package main

import "fmt"
import . "../../btree"

// rootまでのpathを保持して、もう一つのノードと比較
func lca(n, a, b *Node) *Node {
	paths := []*Node{}
	for ; a != nil; a = a.Parent {
		paths = append(paths, a)
	}
	for b != nil {
		if find(b, paths) {
			return b
		} else {
			b = b.Parent
		}
	}
	return nil
}

func find(n *Node, items []*Node) bool {
	for i := 0; i < len(items); i++ {
		if n == items[i] {
			return true
		}
	}
	return false
}

func main() {
	n := FromSlice([]int{0, 1, 2, 3, 4, 5, 6, 7})
	fmt.Println(lca(n, n.Right.Right, n.Right.Left))
}
