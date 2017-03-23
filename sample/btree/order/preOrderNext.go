package main

import "fmt"
import . "../../btree"

// MEMO:
func PreOrderNext (n, prev *Node) *Node {
	if n == nil {
		return nil
    } else if prev != nil && n.Parent == prev {
        return n
    } else if n.Right == prev {
        return PreOrderNext(n.Parent, n)
    } else if n.Left != prev {  // n.Left != nil 不要?
        return PreOrderNext(n.Left, n)
    } else {
        return PreOrderNext(n.Right, n)
    }
}

func Print(n *Node) {
	fmt.Println(n.Value, PreOrderNext(n, nil))
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
