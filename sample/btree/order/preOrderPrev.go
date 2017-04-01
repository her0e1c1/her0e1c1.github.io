package main

import "fmt"
import . "../../btree"

func PreOrderPrev (n, prev *Node) *Node {
	if n == nil {
		return nil
	} else if prev == nil {
        return PreOrderPrev(n.Parent, n)
    } else if n.Left == nil || n.Left == prev {
        return n
    } else if n.Right != prev {
        return PreOrderPrev(n.Right, n)
    } else {
        return PreOrderPrev(n.Left, n)  // n.Left == nil と対応 (elseにふさわしい)
	}
}

func Print(n *Node) {
	fmt.Println(n.Value, PreOrderPrev(n, nil))
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
