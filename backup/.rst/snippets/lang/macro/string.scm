
(gosh #!Q
 (print (eval (let1 b '#"H~|a|GE" `(let1 a "O" ,b)) '()))
Q :str #t :msg "delay expanded variables")


(c #!Q
#include <stdio.h>
#define M(n) int x ## n = n;
int main() {
 M(1); M(2);
 printf("%d, %d", x1, x2);
}
Q :str #t :msg "define variables")
