// 深さDのノードで構築されたlinkedリストを作成 (各深さごとのリストが答え)
package main

import "fmt"
import . "../../btree"

func F(n *Node) [][]*Node {
	// BFSでもdepth++で降りていく場合がよい例??? (ただしメモリがNode数だけ必要)
	depth := 0
	nodes := [][]*Node{{n}}
	for true {
		list := []*Node{}
		for _, n := range nodes[depth] {
			for _, i := range []*Node{n.Left, n.Right} {
				if i != nil {
					list = append(list, i)
				}
			}
		}
		if len(list) == 0 {
			break
		} else {
			nodes = append(nodes, list)
			depth++
		}
	}
	return nodes
}

func main() {
	fmt.Println(F(FromSlice([]int{0, 1, 2, 3, 4, 5, 6, 7})))
}
