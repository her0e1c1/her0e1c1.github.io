// PostOrderNext
package main

import "fmt"
import . "../../btree"

func PostOrderNext (n, prev *Node) *Node {
	if n == nil {
		return nil
	} else if prev == nil {
        return PostOrderNext(n.Parent, n)
	} else if n.Right == prev {
        return n
    } else if n.Left == prev {
        if n.Right != nil {
            return PostOrderNext(n.Right, n)
        } else {
            return n
        }
    } else {  // n.Parent = prev
        if n.Left != nil {
            return PostOrderNext(n.Left, n)
        } else if n.Right != nil {
            return PostOrderNext(n.Right, n)
        } else {
            return n
        }
	}
}

func Print(n *Node) {
	fmt.Println(n.Value, PostOrderNext(n, nil))
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
