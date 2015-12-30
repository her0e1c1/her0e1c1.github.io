(define DATA1 (generator->list (integers$ 200 -100) 20))
(define (to-s x) (string-join (map x->string x) ", "))

(p "ソート済み配列を左端から構築。i順番をその配列の適した位置に挿入. 
0番目はそのままで良いので、1番目からソートする")

(p "挿入については、適した位置が見つかれば、その時点でi番目までソート済みになる。
そのため、ソート済み配列をソートする場合の計算量は、O(n)となる。")

(c #"
#include <myc.h>
static inline void swap(int *x, int *y) { int t=*x; *x=*y; *y=t; }
void sort(int *a, int len) {
 for (int i = 1; i < len; i++) {
  int j = i;
  while (j >= 1 && a[j-1] > a[j]) {
   swap(&a[j-1], &a[j]);
   j--;
  }
 }
}
int main() {
 int a[] = {~(to-s DATA1)};
 sort(a, SIZE(a));
 PVI(a);
}
" :str #t)
