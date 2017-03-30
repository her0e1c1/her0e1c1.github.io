// Longest Increasing Subsequence O(NlogN)
package main

import "fmt"

func lis(a []int) int {
	dp := []int{}
	for i := 0; i < len(a); i++ {
		if len(dp) == 0 || dp[len(dp)-1] < a[i] {
			dp = append(dp, a[i])
		} else {
			lo, rt, hi := 0, 0, len(dp)-1
			for lo <= hi {
				mi := lo + (hi-lo)/2
				if a[i] <= dp[mi] {
					hi = mi - 1
					rt = mi
				} else {
					lo = mi + 1
				}
			}
			dp[rt] = a[i]
		}
	}
	return len(dp)
}

func main() {
	fmt.Println(lis([]int{3, 2, 5, 1, 3, 1, 7, 4})) // 3,5,7 => 3
	fmt.Println(lis([]int{4, 2, 3, 1, 5}))          // 2,3,5 => 3
}
