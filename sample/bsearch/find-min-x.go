package main

import fmt "fmt"


// MEMO: :Q:x^2>=15241578750190521を満たす最小のxを求める
func f(N int) int {
	g := func (x int) bool {
		return x * x >= N
	}
	var hi int
	rv, lo, hi := -1, 0, 2 << 30  // warn: math.Pow(2, 30) float64
	for lo <= hi {
		mi := (lo + hi) / 2
		if g(mi) {
			hi = mi - 1
			rv = mi
		} else {
			lo = mi + 1
		}
	}
	return rv
}

func main() {
	fmt.Printf("%s\n", f(15241578750190521))
}
