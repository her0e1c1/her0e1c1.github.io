package main

import "fmt"

/*
a_iをdpの最小値となる位置で更新するか、最後に追加
{4,2,3,1,5}を例にすると、dpは以下のように更新されていく
4     (空なので4)
2     (4より小さい2で更新)
2,3   (最後が2より大きい)
1,3   (最後の要素より小さいので、minで更新
1,3,5 (最も大きい5は、最後に追加)

答えは 2,3,5だけれども、
各要素をそれよりも小さい値で更新しても問題ないことを利用している.
*/

// MEMO: :Q:LIS(O(NlogN))
func lis(a []int) int {
	dp := []int{}
	for i := 0; i < len(a); i++ {
		if len(dp) == 0 || dp[len(dp)-1] < a[i] {
			dp = append(dp, a[i])
		} else {
			lo, rt, hi := 0, 0, len(dp)-1
			for lo <= hi {
				mi := lo + (hi - lo) / 2
				if a[i] <= dp[mi] {
					hi = mi - 1
					rt = mi
				} else {
					lo = mi + 1
				}
			}
			dp[rt] = a[i]  // i<j st dp[i]<d[j]を満たす最小のiを探す
		}
	}
	return len(dp)
}

func main() {
	fmt.Println(lis([]int{3,2,5,1,3,1,7,4}))  // 3,5,7
	fmt.Println(lis([]int{4,2,3,1,5}))  // 2,3,5
}
