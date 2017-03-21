package main

import "fmt"

// TODO: refactoring

func Sort(a []int, left, right int) {
	if left >= right {
		return
	}
	mid := left + (right - left) / 2
	l := left
	r := mid + 1
	Sort(a, left, mid)
	Sort(a, mid+1, right)
	size := right - left + 1
	buf := make([]int, size)
	k := 0
	for l <= mid && r <= right {
		if a[l] < a[r] {
			buf[k] = a[l]
			l++
		} else {
			buf[k] = a[r]
			r++
		}
		k++
	}
	for l <= mid {
		buf[k] = a[l]
		l++
		k++
	}
	for r <= right {
		buf[k] = a[r]
		r++
		k++
	}
	for i := 0; i < size; i++ {
		// left <= left+i < left+size = right+1
		// =>
		// left <= a[left+i] <= right
		a[left+i] = buf[i]
	}
}

func main() {
	a := []int{1, 4, 45, 3, 7, 6, 7, 7, 7, 10, 8, 8, 8, 8, 1, 10, -1, 3, 20, 5, 9, 33, -1, 4, 5, 3, 6}
	Sort(a, 0, len(a) - 1)
	fmt.Println(a)
}
