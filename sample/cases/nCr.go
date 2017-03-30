// 異なるn個からr個取り出す組み合わせ(nCr)
package main

import "fmt"

func nCr(N, R int) int {
    dp := make([]int, N + 1)
    for n := 0; n <= N; n++ {
        for r := N; r >= 0; r-- {  // 逆順にするとr-1が上書きされない!
            if r == 0 {
                dp[r] = 1
            } else {
                dp[r] += dp[r-1]
            }
        }
        fmt.Println(dp)
    }
    return dp[R]
}

func main() {
	fmt.Println(nCr(4, 2))
	fmt.Println(nCr(5, 3))
}

// int C(int n, int r) {
//     int i, j;
//     row[0] = 1; // this is the value of C(0, 0)
//     for(i = 1; i <= n; i++) {
//         for(j = i; j > 0; j--) {
//             row[j] += row[j - 1];
//         }
//     }
//     return row[r];
// }
