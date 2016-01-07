-- IMPLEMENT: knapsack

{-
  問題としては以下
  n個の詰め物があり、サイズとその価値が決まっている。
  このとき、ナップザックのサイズのmax_sizeとし、詰め物の価値を最大にする組は何か？

  以下の問題に帰着
  [(a1, b1), (a2, b2),,, (an, bn)] -- [(詰め物のサイズ, その価値)]
  (sum ai * xi) <= max_size (ただし、xi in {0, 1})
  max (xi) st sum bi * xi

  総当たりの場合の場合の数は2^nとなる
-}

-- pairs = [(size, price)]
knapsack :: (Ord a, Num a) => [(a, a)] -> a -> a
knapsack pairs max_size = go pairs 0 where
    go [] size = 0
    go ((s,p):sps) size =
      let
        ssize = s + size
        cap1 = go sps size  -- 現在の(s, p)を使わない
        cap2 = if ssize <= max_size then p + go sps ssize else 0
      in maximum [cap1, cap2]

main = do
  print $ knapsack [(x, 6-x) |x <- [1..5]] 6  -- 12


#include <myutils.h>

// ORDER: O(sizes.size() * capacity)  << 2^sizes.size()

int solve(vector<int> sizes, vector<int> prices, int capacity) {
  assert(sizes.size() == prices.size());

  vector<vector<int>> memo(sizes.size() + 1, vector<int>(capacity + 1, -1));

  function <int(int, int)> dfs = [&] (int depth, int size) {
    if (memo[depth][size] != -1)
      return memo[depth][size];

    if (depth == sizes.size())
      return 0;

    // 使用しない場合
    int price = dfs(depth + 1, size);

    // 使用する場合(容量を超えないようにする)
    int s = sizes[depth];
    if (s + size <= capacity)
      price = max(price, prices[depth] + dfs(depth + 1, s + size));

    return memo[depth][size] = price;
  };
  return dfs(0, 0);
}

int main() {
  P(solve({1,2,3,4,5},
          {5,4,3,2,1},
          6));  // 12
}
