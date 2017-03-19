
-- 一つ前の結果に、新しく要素を加えるか、加えないかで分けて考える.
-- f(x:xs)は、[[INT]]なので、xを使う場合とそうでない場合に分ける

-- MEMO: :Q:異なるn個のn個以下の組み合わせ
comb :: Num a => [a] -> [[a]]
comb = go where
  go [] = [[]]  -- WARN: go [] = []
  go (x:xs) = go xs ++ map (x:) (go xs)
-- comb [1..3] => [[],[3],[2],[2,3],[1],[1,3],[1,2],[1,2,3]]

main = do
  print $ comb [1..3]
  print $ comb [1..5]
