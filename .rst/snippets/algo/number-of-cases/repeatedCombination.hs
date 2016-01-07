-- IMPLEMENT: 異なるn個の中から重複を許してr個取り出す場合の数(nHr)

-- 同じものを使い続けるか、それを使わずに次へいくか
-- combinationとの違いは、使用しても消費しない
-- TODO: accを使っているが、末尾再帰の形式になっていなにので遅い(loop版作れる？)
h :: [a] -> Int -> [[a]]
h = go [] where
  go acc _ 0 = [acc]
  go acc [] _ = []
  -- combinationとの違いは xsと(x:xs)の違い
  -- go acc (x:xs) n = go (x:acc) xs (n-1) ++ go acc xs n
  go acc (x:xs) n = go (x:acc) (x:xs) (n-1) ++ go acc xs n

-- 余計な変数accを使わない場合
h1 = go where
  go xs 0 = [[]]
  go [] _ = []
  go (x:xs) n = map (x:) (go (x:xs) (n-1)) ++ go xs n

main = print $ h [1..3] 2
