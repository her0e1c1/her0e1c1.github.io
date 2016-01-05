
(ps "簡易証明")

(p "収束しそうな点を探す必要あり")

(math "
f(x)のx_nにおける接戦は以下の通り
y = f'(x_n)(x - x_n) + f(x_n)

この接戦は、(x_{n+1}, 0)を通過するので
0 = f'(x_n)(x_{n+1} - x_n) + f(x_n)

すなわち
x_{n+1} = x_n - $frac{f(x_nf)}{f'(x_n)}
")
(math "
|$frac{x_{n+1} - x_n}{x_n}| < $epsilon
")
(ps "solve x^2 = n by newton")
(math "x_{n+1} = x_n - $frac{x_n * x_n - 2}{2 * x_n}")

(c #!Q
#include <stdio.h>
double abs(double x) { return x >= 0 ? x : -x; }
double f(double n, double x1, double e) {
 while (1) {
  double x2 = x1 - (x1 * x1 - n) / (2 * x1);
  if (abs(x2-x1) < e) return x2;
  x1 = x2;
 }
}
int main() {
  printf("%f\n", f(2, 5, 0.001));
  printf("%f\n", f(100, 100, 0.001));
}
Q :str #t)
