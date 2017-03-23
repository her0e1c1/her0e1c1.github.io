package main

import "fmt"

/*
-- A -- left -- B -- mid -- C -- right -- D --

本来 left <= mid <= rightが成立する
ただし、lotateしているため、その開始位置がmidの右か左か特定する必要がある。

a[left] < a[mid]のときは、左側が順番に並んでいるので、Cに開始位置がある.
leftとmidの間にtargetがあるか、ないかで区間を狭めることができる。
*/

// MEMO: :Q:k-RoteatedIncreasingOrderArray
func Search(a []int, target int) int {
	lo, hi := 0, len(a) - 1
	for lo <= hi {
		mi := lo + (hi - lo) / 2
		if a[mi] == target {
			return mi
		} else if a[lo] < a[mi] {
			if a[lo] <= target && target <= a[mi]{  // 正常系
				hi = mi - 1
			} else {  // それ以外と考えると楽
				lo = mi + 1
			}
		} else {  // lo ~ miの間にローテションがある
			if a[mi] <= target && target <= a[hi] {
				lo = mi + 1
			} else {
				hi = mi - 1
			}
		}
	}
	return -1
}

func main () {
	//          0,1,2,3,4,5,6,7,8,9
	a := []int {2,2,2,3,3,4,0,0,1,2}
	for i := 0; i < 5; i++ {
		fmt.Printf("%v\n", Search(a, i))
	}
}
