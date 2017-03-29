package main

import "fmt"
import . "../../btree"

// MEMO: :Q:木構造の移動方法
// PRE:  parent -> left   -> right  (幅優先 上から下へ)
// POST: left   -> right  -> parent (深優先 下から上へ)
// IN:   left   -> parent -> right  (左優先 左から右へ)

// 自分のノードの次にある最も近い左のノードは?
// 逆順の時は、右になるな

// MEMO:
func InOrderNext (n, prev *Node) *Node {
	if n == nil {
		return nil
	} else if prev == nil {  // 一番初めは結果を返せない
		if n.Right != nil {
			return InOrderNext(n.Right, n)
		} else {
			return InOrderNext(n.Parent, n)
		}
	} else {
		if n.Left == nil || n.Left == prev {  // Leftに移動できない条件
			return n
		} else if n.Right == prev {
			return InOrderNext(n.Parent, n)
		} else {
			return InOrderNext(n.Left, n)
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
	Print(t)
}