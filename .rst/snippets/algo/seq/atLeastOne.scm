(ps "配列の要素が、少なくとも1回ずつ出現する数列のうち、最小のもの")

(p "CO ")

(math "
i $in S_N, 0 $le i $le I ($in N) s.t.

f(a) = $begin{cases}
1 & (a $in S_N)
0 & (else)
$end{cases}

// ちょっと違うっぽい
$min_x g(S_N) = $begin{cases}
x  & (\sum_{i}^x f(i) = I)
-1 & (else)
$end{cases}
")

(c #!Q
#include <myc.h>
int g(int *S, int N, int I) {
 // c[0] is dummy
 buff[I];
 memset(buff, 0, sizeof(int)*I);
 int sum = 0;
 for (int i = 0; i < N; i++) {
  int a = S[i];
  // if (a > I) continue;
  buff[a]++;
  if (buff[a] == 1)
    sum++;  // first found
  if (sum == I)
   return i;
 }
  return -1;
}
Q :str #t)
