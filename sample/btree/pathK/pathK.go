package main

import "fmt"

func FromSlice(slice []int, i int) *Node {
	if i >= len(slice) {
		return nil
	}
	n := NewNode(slice[i])
	n.left = FromSlice(slice, i*2+1)  // 0(p) -> 1(c)
	n.right = FromSlice(slice, i*2+2) // 0(p) -> 2(c)
	return n
}

type Node struct {
	left  *Node
	right *Node
	value int
}
func NewNode(value int) *Node {
	return &Node{value: value}
}

// MEMO: :Q:2分木における経路の和がK
func (n *Node) PathK(K int) {
	path := []int{}
	var dfs func(*Node)
	dfs = func(n *Node) {
		if n == nil {
			return
		}
		path = append(path, n.value)
		for i := 0; i < len(path); i++ {
			s := 0
			for j := i; j < len(path); j++ {
				s += path[j]
			}
			if s == K {
				fmt.Println(path[i:])
			}
		}
		dfs(n.left)
		dfs(n.right)
		path = path[1:]
	}
	dfs(n)
}

func main() {
	n := FromSlice([]int{0, 1, 2, 3, 4, 5, 6}, 0)
	n.PathK(6)
}
