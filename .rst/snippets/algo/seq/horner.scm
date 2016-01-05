
(math "y = $sum_{i=0}^{n} a_i x^i")

(math "
S_0 & = & a_n
S_1 & = & a_n x + a_{n-1} & = & S_0 * x + a_{n-1}
S_2 & = & a_n x^2 + a_{n-1} x + a_{n-2} & = & S_1 * x + a_{n-2}
...
S_i & = & S_{i-1} * x + a_{n-i}
")

(c #!Q
#include <myc.h>
int S(int *a, int n, int x) {
 int y = a[n - 1];
 for (int i = n - 2; i >= 0; i--)
  y = y * x + a[i];
 return y;
}
int main() {
 int a[] = {3,2,1};
 P("%d", S(a, SIZE(a), 2));
}
Q :str #t)
