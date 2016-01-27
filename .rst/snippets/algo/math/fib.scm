
(math "f(n+2) = f(n+1) + f(n)")

(p "階段を1段、または2段で上がる場合の組み合わせ

- 1 + 1 + 1 + 1 + 1 = 5
- 2 + 1 + 1 + 1 = 5
- 2 + 2 + 1 = 5

")

(ghc "
f n
 | n == 0 || n == 1 = n
 | otherwise = f (n-1) + f (n-2)
main = print $ f 10
" :str #t)

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
" :str #t)
