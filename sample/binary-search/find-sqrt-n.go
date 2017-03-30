// 15241578750190521の平方根を求める（なければfalse)
package main
import "fmt"

func findSqrt(n int) (int, bool) {
	f := func(x int) int {
        return x * x - n
	}
	lo, hi := 0, 2<<31
	for lo <= hi {
		mi := lo + (hi-lo)/2
        rv := f(mi)
        if rv == 0 {
            return mi, true
        } else if rv > 0 {
            hi = mi - 1
        } else {
            lo = mi + 1
        }
	}
	return 0, false
}

func main() {
	fmt.Println(findSqrt(15241578750190521)) // 123456789, true
	fmt.Println(findSqrt(15))  // 0, false
}
