
(math "f(n+2) = f(n+1) + f(n)")

(p "階段を1段、または2段で上がる場合の組み合わせ

- 1 + 1 + 1 + 1 + 1 = 5
- 2 + 1 + 1 + 1 = 5
- 2 + 2 + 1 = 5
")

(ghc "
f n
 | n == 0 || n == 1 = n
 | otherwise        = f (n-1) + f (n-2)
main = print $ f 10
" :warn "simple but slow")

(cpp "
#include <myutils.h>
int main() {
 int N = 10;
 vector<int> fib(N+1, 0);
 fib[1] = 1;
 for (int i = 0; i < N-1; i++) {
  fib[i+2] = fib[i+1] + fib[i];
 }
 P(fib[N]);
}
")

(cpp "
// f(Sn, Sn-1, n) = f(Sn-1 + Sn-2, Sn-1, n-1) (n >= 2)
// f(S1, S0, 1) = f(1, 0, 1)
#include <myutils.h>
int f(int N) {
 if (N == 0) return 0;
 int s1=1, s0=0;
 for (int i = 0; i < N-1; i++) {
  int t = s1;
  s1 = s1 + s0;
  s0 = t;
 }
 return s1;
}
int main() {
 P(f(10));
}
")
