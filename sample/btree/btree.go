package btree

import "fmt"

func (n *Node) String () string {
	v := "(" + fmt.Sprintf("%d", n.Value)
	if n.Left != nil {
		v += " " + n.Left.String()
	}
	if n.Right != nil {
		v += " " + n.Right.String()
	}
	v += ")"
	return v
}

func (n *Node) LeftChild () bool {
	if n.Parent == nil {
		return false
	}
	return n == n.Parent.Left
}

func (n *Node) RightChild () bool {
	if n.Parent == nil {
		return false
	}
	return n == n.Parent.Right
}

type Node struct {
	Parent *Node
	Left  *Node
	Right *Node
	Value int
}

func FromSlice(slice []int) *Node {
	return fromSlice(slice, 0, nil)
}

func fromSlice(slice []int, i int, p *Node) *Node {
	if i >= len(slice) {
		return nil
	}
	n := &Node{Value: slice[i]}
	n.Parent = p
	n.Left = fromSlice(slice, i*2+1, n)  // 0(p) -> 1(c)
	n.Right = fromSlice(slice, i*2+2, n) // 0(p) -> 2(c)
	return n
}
