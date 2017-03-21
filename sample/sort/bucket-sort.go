package main

import "fmt"

func BucketSort(a []int, max int) []int {
	cnt := make([]int, max)
	for _, n := range a {
		cnt[n]++
	}
	off := make([]int, max)
	// off[0] = 0
	// off[1] = off[0] + cnt[0]
	for i := 1; i < len(cnt); i++ {
		off[i] = cnt[i-1] + off[i-1]
	}
	buf := make([]int, len(a))
	for i := 0; i < len(a); i++ {
		v := a[i]
		buf[off[v]] = v
		off[v]++
	}
	return buf
}

func main() {
	a := []int{3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5, 8, 9}
	fmt.Println(BucketSort(a, 10))
}
