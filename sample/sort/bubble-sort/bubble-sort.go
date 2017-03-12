package main
import "fmt"
/*
bubble sortは末尾からsortされる ::

   1回目     : 0 <= j <= size - 1
   2回目     : 0 <= j <= size - 2
   size-1回目: 0 <= j <= size - (size-1) = 1
   size回目  : 0 <= j <= size - size = 0 (meaningless)
*/

/*
数列a_N = (a_1 a_2 ... a_N) = $hat{a} S.T.
g(N)        &=& $hat{a}
g(i-1)      &=& f(i, i)
f(0, end)   &=& g(end)
f(j+1, end) &=&
$begin{cases}
  swap(f(j, end), j, j+1) & (IF a_j > a_{j+1})
  f(j, end)               & (else $mbox{j >= endの場合、f(j, end) = f(j+n, end)なので、プログラム上はループ終了})
$end{cases}
*/

func swap(x, y *int) { *x, *y = *y, *x }
// MEMO:
func Sort(a []int) {
	for end := len(a)-1; end >= 1; end-- {
		for j := 0; j < end; j++ {
			if a[j] > a[j+1] {
				swap(&a[j], &a[j+1])
			}
		}
	}
}

func main() {
	a := []int {1, 4, 45, 3, 7, 6, 7, 7, 7, 10, 8, 8, 8, 8,1, 10, -1, 3, 20, 5, 9, 33, -1, 4,5,3,6}
	Sort(a)
	fmt.Println(a);
}
