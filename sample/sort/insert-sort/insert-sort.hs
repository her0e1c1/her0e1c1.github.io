-- ソート済み配列に対して、適切な位置にyを挿入(本来は後ろからswap)

{-
ソート済み配列を左端から構築。i順番をその配列の適した位置に挿入. 
0番目はそのままで良いので、1番目からソートする

挿入については、適した位置が見つかれば、その時点でi番目までソート済みになる。
そのため、ソート済み配列をソートする場合の計算量は、O(n)となる
-}

{- math
S_n := ${vector(a_1, a_2, ... a_n)}
f(S_i) = insert f(S_{i-1}) a_i
insert(S_0, a_{i+1}) = ${ vector(a_{i+1}) $}
insert(S_i, a_{i+1}) =
$begin{cases}
append(a_{i+1}, S_i) & (a_i < a_{i+1})
append(a_i, insert(S_{i-1}, a_{i+1}))
$end{cases}
-}

-- MEMO:
sort :: Ord a => [a] -> [a]
sort [] = []
sort (x:xs) = insert x $ sort xs where
  insert y [] = [y]
  insert y (x:xs)
    | x < y = x:insert y xs
    | otherwise = y:x:xs

main = print $ sort [3,1,2,5,4]
