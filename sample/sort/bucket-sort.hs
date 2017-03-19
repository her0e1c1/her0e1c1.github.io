module BucketSort2 (bucketsort, bucketsortBy, bucketsortDescBy) where
import Data.Array (accumArray, elems)

{-# INLINE bucketsort #-} -- 昇順ソート
bucketsort :: (Int, Int) -> [Int] -> [Int]
bucketsort = bucketsortBy id

{-# INLINE bucketsortBy #-} -- 昇順ソート
-- MEMO:
bucketsortBy :: (a -> Int) -> (Int, Int) -> [a] -> [a]
bucketsortBy getkey dom = concatMap reverse . filter (not . null)
    . elems . accumArray (flip (:)) [] dom . map (\x -> (getkey x, x))

{-# INLINE bucketsortDescBy #-} -- 降順ソート
bucketsortDescBy :: (a -> Int) -> (Int, Int) -> [a] -> [a]
bucketsortDescBy getkey dom = reverse . concat . filter (not . null)
    . elems . accumArray (flip (:)) [] dom . map (\x -> (getkey x, x))

-- MEMO:
bucketsort' :: [Int] -> [Int] -> [Int]
bucketsort' keys xs = [x| k <- keys, x <- xs, x == k]

-- 値の定義域は [0, 9]
main = do
  print $ bucketsort (0,9) [3,1,4,1,5,9,2,6,5,3,5,8,9]
  print $ bucketsort' [0..9] [3,1,4,1,5,9,2,6,5,3,5,8,9]
