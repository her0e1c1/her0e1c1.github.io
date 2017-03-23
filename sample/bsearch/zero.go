package main

import "fmt"

// lowは探索ずみなので?、low + 1 < midでも良い
// mi >= lo だと mi < loになる可能性がある

// MEMO: :Q:interspersedWithZero(0が途中に混ざった場合のbinary search)[CI9.5]
func find(a []int, target int) int {
	// 区間[low, high]となるため、-1を忘れない
	lo, hi := 0, len(a) - 1
	for lo <= hi {
		mi := lo + (hi - lo) / 2
		for mi > lo && a[mi] == 0 { mi-- }  // ADD
		if a[mi] == target {
			return mi
		} else if target < a[mi] {
			hi = mi - 1
		} else {
			lo = mi + 1
		}
	}
	return -1  // NOT FOUND
}

func main() {
	//          0  1  2  3  4  5  6  7  8  9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27
	a := []int {0, 1, 0, 0, 2, 0, 3, 0, 0, 0, 0, 0, 0, 0, 4, 0, 0, 0, 0, 5, 6, 0, 7, 0, 0, 8, 9, 0}
	for i:= 0; i <= 10; i++ {
		fmt.Printf("%v, ", find(a, i))
	}
	// OUTPUT: 0, 1, 4, 6, 14, 19, 20, 22, 25, 26, -1,
}
