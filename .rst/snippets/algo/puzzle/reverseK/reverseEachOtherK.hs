-- IMPLEMENT: reverseEachOtherK

go :: [Int] -> Int -> [Int]
go xs k
  | length xs <= k = l1
  | length xs <= 2 * k = l1 ++ l2
  | otherwise = l1 ++ l2 ++ (go l3 k)
  where
    l1 = reverse $ take k xs
    l2 = take k $ drop k xs
    l3 = drop (2*k) xs

main = do
  print $ go [1..10] 3 -- [3,2,1,4,5,6,9,8,7,10]
  print $ go [1..10] 4 -- [4,3,2,1,5,6,7,8,10,9]
