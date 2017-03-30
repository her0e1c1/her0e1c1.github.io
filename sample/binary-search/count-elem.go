// 長さlのソート配列に含まれるNの個数
package main
import "fmt"

func search(a []int, f func(int) bool) int {
    rt, lo, hi := 0, 0, len(a)-1
    for lo <= hi {
        mi := lo + (hi - lo) / 2
        if a[i] <= a[mi] {
            hi = mi - 1
            rt = mi
        } else {
            lo = mi + 1
        }
    }
	return len(dp)
}

func main() {
    for i := 0; i <= 6; i++ {
        fmt.Print(f([]int{1, 1, 1, 2, 2, 3, 4, 4, 4, 5, 6, 6}))
    }
}
