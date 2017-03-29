package main

import "fmt"

type Node int

type Heap struct {
	heap []Node
	size Node // size int
}

func (n Node) parent() Node {
	return (n - 1) / 2
}

func (n Node) left() Node {
	return 2*n + 1
}

func (n Node) right() Node {
	return 2*n + 2
}

func (h *Heap) swap(a, b Node) {
	h.heap[a], h.heap[b] = h.heap[b], h.heap[a]
}

// TODO: MinChildも同時に記述
func (h *Heap) MaxChild(p Node) Node {
	if h.size < p.right() {
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
	var parent Node = 0
	for child := h.MaxChild(parent); child >= 0 && h.heap[parent] < h.heap[child]; parent = child {
		h.swap(parent, child)
	}
}

func (h *Heap) UpHeap(child Node) {
	for parent := child.parent(); h.heap[parent] < h.heap[child]; child = parent {
		h.swap(parent, child)
	}
}

func (h *Heap) Sort() {
	for i := 0; i < len(h.heap); i++ {
		h.UpHeap(Node(i))
		h.size++
	}
	for i := len(h.heap) - 1; i >= 0; i-- {
		h.swap(0, h.size-1)
		h.size--
		h.DownHeap()
	}
}

func NewHeap(heap []Node) *Heap {
	return &Heap{heap: heap, size: 0}
}

func main() {
	h := NewHeap([]Node{5, 3, 1, 2, 4})
	fmt.Println(h)
	h.Sort()
	fmt.Println(h)
}
