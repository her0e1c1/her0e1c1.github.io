// in order next
package main

import "fmt"
import . "../../btree"

func InOrderNext (n, prev *Node) *Node {
	if n == nil {
		return nil
	} else if prev == nil {
		if n.Right != nil {
			return InOrderNext(n.Right, n)
		} else {
			return InOrderNext(n.Parent, n)
		}
	} else {
		if n.Left == prev {
			return n
		} else if n.Right == prev {
			return InOrderNext(n.Parent, n)
		} else {  // n.Parent == prev
            if n.Left != nil {
                return InOrderNext(n.Left, n)
            } else {
                return n
            }
		}
	}
}

func Print(n *Node) {
	fmt.Println(n.Value, InOrderNext(n, nil))
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
	fmt.Println(t.Right.Right)
    t.Right.Right.Right = &Node{Value: -1, Parent: t.Right.Right}
    t.Right.Right.Right.Right = &Node{Value: -2, Parent: t.Right.Right.Right}
	Print(t)
}
