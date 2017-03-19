package main

import "fmt"

// 再帰関数の呼び出しするときに、スタックに実引数を積む必要があるので、メモリスペースは、平均O(logN)必要

// MEMO:
func QuickSort(a []int, left, right int) {
	if !(left < right) {
		return
	}
	// pivotは左右を含むし、どこでもいいはず、なら左端に決め打つ
	var k, pivot int
	k, pivot = left, left
	for i := left + 1; i <= right; i++ {
		if a[i] < a[pivot] {
			k++  // kは前の最後の保存場所
			a[i], a[k] = a[k], a[i]
		}
	}
	// pivotを(全体の)k番目にする (覚えておくと組み立てやすい)
	a[pivot], a[k] = a[k], a[pivot]
	// pivotを境にソートされているので、kを含まなくて良い
	QuickSort(a, left, k-1)
	QuickSort(a, k+1, right)
}

func main() {
	a := []int{1, 4, 45, 3, 7, 6, 7, 7, 7, 10, 8, 8, 8, 8, 1, 10, -1, 3, 20, 5, 9, 33, -1, 4, 5, 3, 6}
	QuickSort(a, 0, len(a)-1)
	fmt.Println(a)
}
