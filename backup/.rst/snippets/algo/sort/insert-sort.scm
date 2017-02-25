(define DATA1 (generator->list (integers$ 200 -100) 20))
(define (to-s x) (string-join (map x->string x) ", "))

(p "ソート済み配列を左端から構築。i順番をその配列の適した位置に挿入. 
0番目はそのままで良いので、1番目からソートする")

(p "挿入については、適した位置が見つかれば、その時点でi番目までソート済みになる。
そのため、ソート済み配列をソートする場合の計算量は、O(n)となる。")

(math #!Q
S_n := ${vector(a_1, a_2, ... a_n)}
f(S_i) = insert f(S_{i-1}) a_i
insert(S_0, a_{i+1}) = ${ vector(a_{i+1}) $}
insert(S_i, a_{i+1}) = $begin{cases} append(a_{i+1}, S_i) & (a_i < a_{i+1})
append(a_i, insert(S_{i-1}, a_{i+1}))
$end{cases}
Q:str #t)

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

(ghc #!Q
insert [] y = [y]
insert (x:xs) y
 | x < y = x:insert xs y
 | otherwise = y:x:xs
sort [] = []
sort (x:xs) = insert (sort xs) x
main = print $ sort [3,1,2,5,4]
Q
:str #t
:msg "ソート済み配列に対して、適切な位置にyを挿入(本来は後ろからswap)")
