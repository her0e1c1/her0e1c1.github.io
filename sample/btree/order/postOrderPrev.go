package main

import "fmt"
import . "../../btree"

// MEMO:
func PostOrderPrev (n, prev *Node) *Node {
	if n == nil {
		return nil
    } else if prev != nil && n.Parent == prev {  // 下向きの時は、即返す
        return n
    } else if n.Left == prev {  // 右子供には既に移動したので親へ
        return PostOrderPrev(n.Parent, n)
    } else if n.Right != prev {
        return PostOrderPrev(n.Right, n)
    } else {
        return PostOrderPrev(n.Left, n)
    }
}

func Print(n *Node) {
	fmt.Println(n.Value, PostOrderPrev(n, nil))
	if n.Left != nil {
		Print(n.Left)
	}
	if n.Right != nil {
		Print(n.Right)
	}
}

func main () {
	t := FromSlice([]int{0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10})
	fmt.Println(t)
	Print(t)
}
