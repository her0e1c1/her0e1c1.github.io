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
positiveLsdSort :: (Bits a) => [a] -> [a]
-- positiveLsdSort list = foldl step list [0..bitSize (head list)] where
positiveLsdSort = flip (foldl step) [0..bitSize (0 :: Int)] where
  step list bit = uncurry (++) $ partition (not . flip testBit bit) list