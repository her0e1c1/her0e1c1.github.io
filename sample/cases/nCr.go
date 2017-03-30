// 異なるn個からr個取り出す組み合わせ(nCr)
package main

import "fmt"

func nCr(N, R int) int {
    dp := make([]int, N + 1)
    for n := 0; n <= N; n++ {
        for r := N; r > 0; r-- {  // 逆順にするとr-1が上書きされない!
            dp[r] += dp[r-1] // be careful of overflow
        }
        dp[0] = 1
    }
    return dp[R]
}

func main() {
	fmt.Println(nCr(4, 2))
	fmt.Println(nCr(5, 3))
}
