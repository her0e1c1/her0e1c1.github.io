
(math "y = $sum_{i=0}^{n} a_i x^i")

(math "
S_n &=& a_0 x^n + a_1 x^{n-1} + ... + a_{n-1} x + a_n
    &=& $sum_{i=0}^{n} a_i x^{n-i}
    &=& $sum_{i=0}^{n-1} a_i x^{n-i} + a_n
    &=& x $sum_{i=0}^{n-1} a_i x^{(n-1)-i} + a_n
    &=& x S_{n-1} + a_n
")

(c #!Q
#include <myc.h>
int S(int *a, int n, int x) {
 assert(n > 0);
 int s = a[0];
 for (int i = 1; i < n; i++)
  s = s * x + a[i];
 return s;
}
int main() {
 int a[] = {3,2,1};  // 3x^2 + 2x + 1
 P("%d\n", S(a, SIZE(a), 2));
 P("%d\n", S(a, SIZE(a), 1));
 P("%d\n", S(a, SIZE(a), 0));
}
Q :str #t)

(ps "one byte offset")
(p "last - first = n - 1")
(math "$sum_{i=1}^{n} a_i = $sum_{i=0}^{n-1} a_{i+1} = $sum_{i=2}^{n+1} a_{i-1}")
