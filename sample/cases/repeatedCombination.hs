
-- MEMO: :Q:重複組み合わせ(nHr)
h = go where
  go xs 0 = [[]]
  go [] _ = []  -- fail
  go (x:xs) n = [x:ys | ys <- go (x:xs) (n-1)]  ++ go xs n
-- [[1,1],[1,2],[1,3],[2,2],[2,3],[3,3]]
main = print $ h [1..3] 2
