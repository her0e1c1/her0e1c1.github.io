// Return true If a sub tree is a part of the parent tree
package main

import "fmt"
import . "../../btree"

// large とあるが、これは余計なspaceを使わないという意味. メモリ上では収まることを仮定してよい
func subTree(tree, sub *Node) bool {
	if sub == nil {
		return true
	} else if tree == nil {
		return false
	} else if matchTree(tree, sub) {
		return true
	} else {
		return subTree(tree.Left, sub) || subTree(tree.Right, sub)
	}
}

func matchTree(a, b *Node) bool {
	if a == nil && b == nil {
		return true
	} else if a != nil && b != nil && a.Value == b.Value {
		return matchTree(a.Left, b.Left) && matchTree(a.Right, b.Right)
	} else {
		return false
	}
}

func main() {
	n2 := FromSlice([]int{1, 3, 4})
	n23 := FromSlice([]int{0, 1, 23})
	n5 := FromSlice([]int{0, 1, 2, 3, 4, 5})
	fmt.Println(subTree(n5, n2))
	fmt.Println(subTree(n5, n23))
}
