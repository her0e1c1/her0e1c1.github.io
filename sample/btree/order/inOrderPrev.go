package main

import "fmt"
import . "../../btree"

// MEMO:
func InOrderPrev (n, prev *Node) *Node {
// left -> parent -> right PREV で考えずに
// left <- parent <- right NEXT で考える
	if n == nil {
		return nil
	} else if prev == nil {
		if n.Left != nil {
			return InOrderPrev(n.Left, n)
        } else {
			return InOrderPrev(n.Parent, n)
		}
	} else {
        if n.Right == nil || n.Right == prev {
			return n
		} else if n.Left == prev {
			return InOrderPrev(n.Parent, n)
		} else {
			return InOrderPrev(n.Right, n)
		}
	}
}

func Print(n *Node) {
	fmt.Println(n.Value, InOrderPrev(n, nil))
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
