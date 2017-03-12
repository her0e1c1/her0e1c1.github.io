import Data.List

-- MEMO: :Q:anagram同士が隣同士になるようソート(CI9.2)
sort' :: [String] -> [String]
sort' = Data.List.sortBy (\a b -> compare (sort a) (sort b))

main = do
  print $ sort' ["cb", "abc", "a", "bb", "bac", "ca", "d", "cba", "bc", "acb"]
