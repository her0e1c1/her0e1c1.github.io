
(p "
n個の詰め物があり、サイズとその価値が決まっている。
このとき、ナップザックのサイズのmaxSizeとし、詰め物の価値を最大にする組は何か？
なお、総当たりの場合の場合の数は2^nとなる
")

(math "
${ (a_i, b_i) &=& (詰め物のサイズ, その価値) $}
$sum_i^n a_i x_i &$le& maxSize (ただし、x_i $in {0, 1})
S.T. $max_{x_i} $sum_i^n b_i x_i
")

(math "f(i, size) = $begin{cases} $max ${f(i-1, size), f(i-1, size + a_i) + b_i (IF size + a_i $le maxSize) $}$end{cases}")
(math "f(i, size) = $begin{cases} $max ${f(i-1, size), f(i-1, size - a_i) + b_i (IF size - a_i $ge 0) $}")

(ghc #!Q
-- pairs = [(size, price)] (逆方向)
knapsack :: (Ord a, Num a) => [(a, a)] -> a -> a
knapsack pairs size = go pairs size where
    go [] size = 0
    go ((s,p):sps) size =
      let
        ssize = size - s
        cap1 = go sps size  -- 現在の(s, p)を使わない
        cap2 = if ssize >= 0 then p + go sps ssize else 0
      in maximum [cap1, cap2]
main = print $ knapsack [(x, 6-x) |x <- [1..5]] 6
Q :str #t)

(cpp #!Q
#include <myutils.h>
int solve(vector<int> sizes, vector<int> prices, int capacity) {
  assert(sizes.size() == prices.size());
  int S = sizes.size();
  vector<vector<int>> dp(sizes.size() + 1, vector<int>(capacity + 1, 0));
  for (int s = 0; s < S; s++) {
    for (int c = 0; c <= capacity; c++) {  // =を忘れない(順方向)
      int c1 = c- sizes[s];
      if (c1 >= 0)
        dp[s+1][c] = max(dp[s][c], dp[s][c1] + prices[s]);
      else
        dp[s+1][c] = dp[s][c];
    }
  }
  return dp[S][capacity];
}
int main() {
  P(solve({1,2,3,4,5},
          {5,4,3,2,1},
          6));
}
Q :str #t :msg "dp")

(cpp #!Q
#include <myutils.h>
// 配列の再利用(正直、ループの順方向と逆方向で結果が変わる理由がよくわかってない！)
int solve(vector<int> sizes, vector<int> prices, int capacity) {
  assert(sizes.size() == prices.size());
  int S = sizes.size();
  vector<int> dp(capacity + 1, 0);
  for (int s = 0; s < S; s++)
   for (int c = capacity; c >= sizes[s]; c--)
    dp[c] = max(dp[c], dp[c-sizes[s]] + prices[s]);
  return dp[capacity];
}
int main() {
  P(solve({1,2,3,4,5},
          {5,4,3,2,1},
          6));
}
Q :str #t :msg "dp")
