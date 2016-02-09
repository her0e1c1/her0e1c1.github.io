(ps "配列の要素が、少なくとも1回ずつ出現する数列のうち、最小のもの")

(p "CO ")

(math "
$exists I $in N, $forall a_i $in S_N, 0 $le a_i $le I s.t.

$min_{x} g(S_x) = $begin{cases} x  & ($sum_{i==0}^I f(i) = I + 1)
-1 & (else)
$end{cases}

f(a) = $begin{cases} 1 & (a $in S_x)
0 & (else)
$end{cases}
")

(c #!Q
#include <myc.h>
int g(int *S, int N, int I) {
 I++; // range is [0, I]
 int buff[I];
 memset(buff, 0, sizeof(int) * I);
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
int main() {
 int S[] = {4,4,1,2,0,5,5,3,1,2};   // 7
 P("%d\n", g(S, SIZE(S), 5));
}
Q :str #t)
