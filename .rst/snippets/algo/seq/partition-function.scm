
(ps "分割数")

(p "dp[i][n]をnをi以下に分割する場合の数とおく.
右のように置き換えることが可能「nをi以下に分割 <=> nをi-1以下に分割 + nをiに分割」
前者はdp[i-1][n]となる。
後者については右のように置き換えることが可能「nをi分割 <=> n-iをi以下に分割」
後者はdp[i][n-i]となる。(各の場合の各分割について、1増やす.)
")

(p "後者の例(6を3分割 <=> 3を3以下に分割)

- 3 = 3 + 0 + 0 (1分割)
- 3 = 2 + 1 + 0 (2分割)
- 3 = 1 + 1 + 1 (3分割)

上記の各場合の各分割に1を加える

- 6 = 4 + 1 + 1 (3分割)
- 6 = 3 + 2 + 1 (3分割)
- 6 = 2 + 2 + 2 (3分割)

1を加えることで、i分割した場合を求めることができる.
")

(math "
dp(1, _) = 1
dp(i, n) = dp(i-1, n) + dp(i, n-i)
")

(ghc "
f i n
 | i == 1 = 1
 | n >= i           = f (i-1) n + f i (n-i)
 | otherwise        = f (i-1) n
main = do
 print $ f 3 4 -- 4
 print $ f 10 10 -- 42
")
