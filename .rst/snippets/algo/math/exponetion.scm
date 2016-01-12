
(math "
a^n = $begin{cases}
 1 & ({n = 0)
 a^{n/2} $times a^{n/2} & ($mbox{n is even})
 a^{(n-1)/2} $times a^{(n-1)/2} $times a & ($mbox{n is odd})
$end{cases}
")

(cpp #!Q
#include <myutils.h>
int f(int a, int n) {
 if (n == 0)
  return 1;
 else if (n % 2 == 0) {
  int x = f(a, n / 2);
  return x * x;
 } else {
  int x = f(a, (n - 1) / 2);
  return x * x * a;
 }
}
int main() {
 P(f(2, 10));
 P(f(3, 2));
 P(f(4, 3));
}
Q :str #t)
