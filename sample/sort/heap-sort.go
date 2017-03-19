package main

import "fmt"

type Node int

type Heap struct {
	heap [] Node
	// size int
	size Node
}

func (n Node) parent () Node {
	return (n - 1) / 2
}

func (n Node) left () Node {
	return 2 * (n - 1) 
}

func (n Node) right () Node {
	return 2 * (n - 1) + 1
}

func (h *Heap) swap(a, b Node) {
	t := h.heap[a]
	h.heap[a] = h.heap[b]
	h.heap[b] = t
}

// TODO: MinChildも同時に記述するには?
func (h *Heap) MaxChild(p Node) Node {
	if h.size <= p.left() {
		return -1
	} else if h.size == p.right() {
		return p.left()
	} else if h.heap[p.left()] >= h.heap[p.right()] {
		return p.left()
	} else {
		return p.right()
	}
}

func (h *Heap) DownHeap() {
	var parent Node
	parent = 0
	for child := h.MaxChild(parent); h.heap[parent] < h.heap[child]; parent = child {
		h.swap(parent, child)
	}
}

func (h *Heap) UpHeap(child Node) {
		fmt.Println("c", child)
	for parent := child.parent(); h.heap[parent] < h.heap[child]; child = parent {
		fmt.Println("p", parent)
		h.swap(parent, child)
	}
}


func (h *Heap) Sort() {
	// var i Node
	// for i = 0; e := range h.heap {
	// fmt.Println("After UpHeap", i,e)
	// 	// h.UpHeap(i)
	// 	// h.size = i + 1
	// }
	// fmt.Println("After UpHeap", h)
}

func NewHeap(heap []Node) *Heap {
	h := &Heap{heap: heap}
	h.size = 0
	return h
}

func main () {
	h := NewHeap([]Node {5, 3, 1, 2, 4})
	fmt.Println(h)
	h.Sort()
}
