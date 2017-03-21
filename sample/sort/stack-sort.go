package main

import "fmt"

type Stack []int
func (s *Stack) Peek() int {
    return (*s)[len(*s)-1]
}
func (s *Stack) Empty() bool {
    return len(*s) == 0
}
func (s *Stack) Push (x int) {
    *s = append(*s, x)
}
func (s *Stack) Pop () int {
	t := (*s)[len(*s)-1]
	*s = (*s)[:len(*s)-1]
	return t
}

func sort(A Stack) stack {
	s := Stack{}
	for !A.Empty() {  // Aの要素をsに移す(s.push(A.Pop())なイメージ)
		t := A.Pop()
		for !s.Empty() && s.Peek() > t {
			A.Push(s.Pop())  // 一度積んだ要素を元に戻すのがミソ
		}
		s.Push(t)
	}
	return s
}

func main () {
	fmt.Println(sort(stack {4,2,3,1,5}))
}
