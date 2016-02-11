
(p "数列{a_n}における、最長部分増加数列")

(math "f(n) = 1 + $max ${ f(k) $mid 1 $le k < n, a_k > a_n $} $cup ${ 0 $}")

(ghc "
import Data.List (maximumBy)
f :: [Int] -> [Int]
f = g where
 c a b = compare (length a) (length b)
 -- g [] = []
 g (x:xs) = x : maximumBy c (map (h . flip drop xs) [0..(length xs)]) where
  h [] = []
  h ys = if head ys > x then g ys else []
main = print $ f [3,2,5,1,3,1,7,4]
")

(p "この方法では、計算量がO(n^2)となる。そこでbinary searchを使い、O(nlogn)に減らす")

(math "
f_i = $begin{cases} (f_{i-1}, a_i}) & (f_{i-1, last} $le a_i)
f_{i-1, x} := a_i & ($min_{a_i < f_{i-1,x}} x) $mbox{配列f_iのx番目をa_iで更新したもの(f_{i-1,x}はa_i以下)}
f_{i-1} & (else)
$end{cases}
")

(p "最小値は、2分木で探すことでlognで探せる")

(cpp "
#include <myutils.h>
int f(vector<int> a) {
 vector<int> dp;
 for (int i = 0; i < a.size(); i++) {
  if (dp.empty() || dp.back() < a[i])
   dp.push_back(a[i]);
  else {
   // *lower_bound(dp.begin(), dp.end(), a[i]) = a[i]; continue;
   int lo = 0, hi = dp.size() - 1, rt = 0;
   while (lo <= hi) {
    int mi = lo + (hi - lo) / 2;
    if (a[i] <= dp[mi]) {
     hi = mi - 1;
     rt = mi;
    } else
     lo = mi + 1;
   }
   dp[rt] = a[i];
  }
 }
 return dp.size();
}
int main() {
 P(f({3,2,5,1,3,1,7,4}));
 P(f({4,2,3,1,5}));
}
")
