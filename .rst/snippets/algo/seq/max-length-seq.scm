
(math"{a_n}の要素の数列で、a_{in} > a_{i(n-1)} ... > a{i1}を満たす数列で、要素数が最大のものは？(1<=ik<=n)")

(math "a_n > a_k $quad s.t $quad $max $# ${ f(a_n) $} = ${ a_n $} $cup $max_{0<=k<n} $# ${ f(a_k) $}")

(p "pointは、f(n)はnより大きいものには依存せず、n未満で決まる")

(p"また、全ての場合の数は、2^nとなる.
S4=[0..3]に対して、以下のように分割する必要あり
S3=[1,2,3]
S2=[2,3]
S1=[3]
S0=[] -- ここまで必ず分割すること(終了条件)
")

(ghc #!Q
-- TODO: f に該当する関数は何?
import Data.List (maximumBy)
maxLengthSequence :: [Int] -> [Int]
maxLengthSequence = go where
  go [] = []
  go (x:xs) = x : (maximumBy f $ map g [0..length xs]) where
    f a b = compare (length a) (length b)
    g = go . filter (> x) . flip drop xs
main = print $ maxLengthSequence [1,3,2,5,4,5,6];
Q :str #t)

(cpp #!Q
#include <myutils.h>
vector<int> solve(vector<int> A) {
  function <vector<int>(int)> dfs = [&] (int depth) {
    if (depth < 0) return vector<int>();
    vector<int> seq;  // 本来はintでいいが結果も表示させたいので配列とした
    for (int i = depth - 1; i >= 0; i--) {
      if (A[i] < A[depth]) {
        vector<int> s = dfs(i);
        if (s.size() > seq.size())
          seq = s;
      }
    }
    seq.push_back(A[depth]);
    return seq;
  };
  return dfs(A.size() - 1);
}
int main() {
 PE(solve({1,2,3,4,5}));
 PE(solve({1,3,2,5,4,5,6}));
}
Q :str #t)
