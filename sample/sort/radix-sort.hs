
import Data.Bits (Bits(testBit, bitSize, bitSizeMaybe))
import Data.List (partition)

-- 上位の桁からソートするようにすると MSD radix sort

-- lsdSort :: (Ord a, Bits a)  => [a] -> [a] -- error
lsdSort :: [Int] -> [Int]
lsdSort = fixSort positiveLsdSort

-- 負の数は最上位が1なので必ず正の数より大きくなる
-- Fix a sort that puts negative numbers at the end, like positiveLsdSort and positiveMsdSort
fixSort sorter list = uncurry (flip (++)) (break (< 0) (sorter list))

-- 最大bitを取得するのにbitSizeを使用(32 or 64)
-- MEMO:
positiveLsdSort :: (Bits a) => [a] -> [a]
positiveLsdSort = flip (foldl f) [0..bitSize (0 :: Int)] where
  f acc x = uncurry (++) $ partition (not . flip testBit x) acc

main = do
  print $ lsdSort [0,1,2,3,4,5,6,7,8,9,6,5,4,3,6,5,4,3,10,9,8,7,6,5,4,3,2,1,0]
