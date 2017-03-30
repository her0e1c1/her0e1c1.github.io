-- 長さlのソート配列に含まれるNの個数

countElem xs n = (foldl f 0 bits) - (foldl g (2^32) bits) + 1 where
  f acc x = if f2 (acc + x) then acc + x else acc
  g acc x = if g2 (acc - x) then acc - x else acc  -- (head xs) > n なら-1を返すべき. (head xs) < nの場合は(length xs)を返す
  f2 a = (length xs) > a && xs !! a <= n
  g2 a = (length xs) <= a || a >= 0 && xs !! a >= n  -- 配列のサイズを超える場合は、indexが小さくなる方向へ
  bits = reverse [2^i | i<-[0..32]]

main = do
 mapM_ (print . countElem [1, 1, 1, 2, 2, 3, 4, 4, 4, 5, 6, 6]) [0..7]
