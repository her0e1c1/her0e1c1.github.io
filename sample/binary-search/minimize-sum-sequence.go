// ある配列をK個に区分したときの、区分配列のうち最大和の最小値を求める(ただし要素がない配列も１つと数えることが可能)
package main

import "fmt"

// 最大和をsumとした時に、実際の和がsumにならない時は、それよりも小さいsumが存在するということ
// 最大和が小さすぎると、K個に配列を分割できない場合は、それよりも大きなsumで探索する必要がある
func f(sum, K int, a []int) bool {
	s, k := 0, 0
	for i := 0; i < len(a); i++ { // greedy
		if s+a[i] <= sum { // sumが緩くても大丈夫. trueを返しそれよりも小さなsumで探索
			s += a[i]
		} else {
			s = a[i]
			k++
		}
		if k == K {
			return false
		}
	}
	return true
}

func Search(a []int, K int) int {
	lo := a[0] // max(A)
	for i := 1; i < len(a); i++ {
		if lo < a[i] {
			lo = a[i]
		}
	}
	hi := 0 // sum(A)
	for i := 0; i < len(a); i++ {
		hi += a[i]
	}
	rv := -1
    // [max(A), sum(A)]の範囲で2分探索する
	for lo <= hi {
		mi := lo + (hi-lo)/2
		if f(mi, K, a) { // min arg f(x) >= k
			hi = mi - 1
			rv = mi
		} else {
			lo = mi + 1
		}
	}
	return rv
}

func main() {
	fmt.Println(Search([]int{2, 1, 5, 1, 2, 2, 2}, 3))
	fmt.Println(Search([]int{0, 1000, 0}, 1))
}
