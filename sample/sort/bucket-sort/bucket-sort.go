package main

import "fmt"

// Ok = sum CNT(i) (0 <= i < k)
// Ok <= k < O(k+1)

// 範囲が決まっていれば、個数を調べて、offsetで並べる
// ORDER: size + range

// [0, max)
func Sort(a []int, max int) []int {
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

func main () {
	a := []int {3,1,4,1,5,9,2,6,5,3,5,8,9}
	fmt.Println(Sort(a, 10))
}
