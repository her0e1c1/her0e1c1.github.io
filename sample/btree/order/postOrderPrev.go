package main

import "fmt"
import . "../../btree"

func PostOrderPrev (n, prev *Node) *Node {
	if n == nil {
		return nil
    } else if prev == nil {
        if n.Right != nil {
            return PostOrderPrev(n.Right, n)
        } else if n.Left != nil {
            return PostOrderPrev(n.Left, n)
        } else {
            return PostOrderPrev(n.Parent, n)
        }
    } else {
        if n.Parent == prev {  // 下向きの時は、即返す
            return n
        } else if n.Left == prev {
            return PostOrderPrev(n.Parent, n)
        } else {
            if n.Left != nil {
                return PostOrderPrev(n.Left, n)
            } else {
                return PostOrderPrev(n.Parent, n)
            }
        }
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
