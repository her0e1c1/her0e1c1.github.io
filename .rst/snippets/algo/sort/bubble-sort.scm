
(p"bubble sortは末尾からsortされる ::

   1回目     : 0 <= j <= size - 1
   2回目     : 0 <= j <= size - 2
   size-1回目: 0 <= j <= size - (size-1) = 1
   size回目  : 0 <= j <= size - size = 0 (meaningless)
")

(math "
数列a_N = (a_1 a_2 ... a_N) = $hat{a} S.T.
g(N) &=& $hat{a}
g(i-1) &=& f(i, i)
f(0, end) &=& g(end)
f(j+1, end) &=& $begin{cases} swap(f(j, end), j, j+1) & (IF a_j > a_{j+1})
f(j, end) & (else $mbox{j >= endの場合、f(j, end) = f(j+n, end)なので、プログラム上はループ終了})
$end{cases}
")

(c #!Q
#include <myc.h>
void swap(int *x, int *y) { int t=*x; *x=*y; *y=t; }
void sort(int *a, int size) {
  for (int end = size - 1; end >= 1 ; end--) {
    for (int j = 0; j < end ; j++) {
      if (a[j] > a[j + 1])
       swap(&a[j], &a[j+1]);
    }
  }
}
int main() {
  int a[] = {1, 4, 45, 3, 7, 6, 7, 7, 7, 10, 8, 8, 8, 8,1, 10, -1, 3, 20, 5, 9, 33, -1, 4,5,3,6};
  sort(a, SIZE(a));
  PVI(a);
}
Q :str #t)

(ghc #!Q
f [] = []
f xs = f (take (length ys - 1) ys) ++ [last ys] where
 ys = g xs
g [x] = [x]
g (x:y:zs)
 | x < y     = x:g (y:zs)
 | otherwise = y:g (x:zs)
main = print $ f [3,1,2,5,4]
Q :str #t)
