import Test.Hspec
import Test.QuickCheck

-- quickCheck $ \x -> x < 0 ==> x * x >= 0
-- quickCheck $ \x y -> (x::Int) > y

-- MEMO:
length' :: [a] -> Int
length' = foldr (const (+1)) 0
-- (const (+1)) 2 3 == 4
-- (+1) ((const) 2 3)
-- const 2 3 == 2
-- Error ((+1) . const) 2 3

-- MEMO:
reverse' :: [a] -> [a]
reverse' = foldl (flip (:)) []

-- MEMO:
elem' :: (Eq a) => a -> [a] -> Bool  -- O(n)
elem' a [] = False
elem' a (x:xs) = a == x || elem' a xs -- (n-1)の結果を使うものは、共有メモリで計算できると思った

-- MEMO:
unique' :: (Eq a) => [a] -> [a] -- O(n^2)
unique' [] = []
unique' (x:xs) = let ys = unique' xs in if elem' x ys then ys else x:ys

-- MEMO:
foldl' :: (b -> a -> b) -> b -> [a] -> b
-- a0 + a1 + ... an = (((a0 + a1) + ... ) + an-1) + an)
-- foldl f a0 Sn = f (foldl a0 Sn-1) an
foldl' f acc [] = acc
foldl' f acc (x:xs) = foldl' f (f acc x) xs  -- 末尾再帰

-- MEMO:
foldr' :: (a -> b -> b) -> b -> [a] -> b
-- a1 + ... an + a0 = (a1 + ... + (an-1 + (an + a0)))
-- foldr f a0 Sn = f (foldr a0 Sn-1) an
foldr' f acc [] = acc
foldr' f acc (x:xs) = f x (foldr' f acc xs)

-- MEMO: :Q:foldlとfoldrの違い
-- foldlは左の要素から計算(+) かつ、(acc X x)
-- foldrは右の要素から計算(cons) かつ、 (x X acc)

-- MEMO:
span' :: (a -> Bool) -> [a] -> ([a], [a])
-- 条件に合致し続けるまでの要素, それ以外
span' f [] = ([], [])
span' f (x:xs)
  | f x = let (ys, zs) = span' f xs in (x:ys, zs)
  | otherwise =  ([], x:xs)

-- MEMO:
break' :: (a -> Bool) -> [a] -> ([a], [a])
-- 条件に合致し続したところで終了
break' p = span (not . p)

-- MEMO:
groupBy' :: (a -> a -> Bool) -> [a] -> [[a]]
-- A sorted list is required
groupBy' p [] = []
groupBy' p (x:xs) = (x:ys):(groupBy' p zs) where
  (ys, zs) = span (p x) xs

-- MEMO:
zip' :: [a] -> [b] -> [(a,b)]
-- ２つの配列のうち、要素数の少ない方に要素数を合わせる
zip' [] y = []
zip' x [] = []
zip' (x:xs) (y:ys) = (x,y):zip' xs ys

-- MEMO:
zipWith' :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith' f xs ys = map (uncurry f) (zip xs ys)

-- MEMO:
deleteBy' :: Eq a => (a -> Bool) -> [a] -> [a]
deleteBy' eq [] = []
deleteBy' eq (x:xs) = let ys = deleteBy' eq xs in if eq x then ys else x:ys

-- MEMO:
unstableSplit :: [a] -> ([a], [a])
-- リストの先頭の要素を2つ取り出して、双方に渡す
unstableSplit (x:y:zs) = (x:xs, y:ys) where (xs, ys) = unstableSplit zs
unstableSplit xs = (xs, [])

-- MEMO:
stableSplit :: [a] -> ([a], [a])
-- xsは1つ消費, ysは2つ消費. zsが0 or 1になるところでちょうどxsは半分消費したことになるので、そこで半分に分割
stableSplit xs = go xs xs where
  go (x:xs) (_:_:ys) = (x:us, vs) where (us, vs) = go xs ys
  go xs _ = ([], xs)

main = hspec $ do
  describe "list" $ do
    it "length" $ do
      length' [] `shouldBe` 0
      length' [2, 1, 3] `shouldBe` 3

    it "reverse" $ do
      reverse' [1..3] `shouldBe` [3,2,1]

    it "elem" $ do
      elem' 1 [1..3] `shouldBe` True
      elem' 5 [1..3] `shouldBe` False

    it "unique" $ do
      unique' [1..3] `shouldBe` [1..3]
      unique' [1,1,1,2,2,3] `shouldBe` [1..3]

    it "foldl" $ do
      foldl' (+) 0 [1..5] `shouldBe` 15

    it "foldr" $ do
      foldr' (:) [] [1..5] `shouldBe` [1,2,3,4,5]

    it "span" $ do
      span (>0) (reverse [-2..2]) `shouldBe` ([2, 1], [0, -1, -2])

    it "break" $ do
      break' (>0) [-2..2] `shouldBe` ([-2, -1, 0], [1, 2])

    it "groupBy" $ do
      groupBy' (==) [1,1,1,2,2,3]  `shouldBe` [[1, 1, 1], [2, 2], [3]]

    it "zip" $ do
      zip [1..3] [-3..(-1)] `shouldBe` [(1, -3), (2, -2), (3, -1)]
      zip [1..3] [-3..(-2)] `shouldBe` [(1, -3), (2, -2)]

    it "zipWidth" $ do
      zipWith' (+) [1..3] [-3..(-1)] `shouldBe` [-2, 0, 2]
      zipWith' (+) [1..3] [-3..(-2)] `shouldBe` [-2, 0]

    it "deleteBy" $ do
      deleteBy' (==1) ([0..3] ++ [1]) `shouldBe` [0, 2, 3]
      deleteBy' (==1) ([1,1,1]) `shouldBe` []

    it "unstableSplit" $ do
      unstableSplit [-3..3] `shouldBe` ([-3, -1, 1, 3], [-2, 0, 2])
     
    it "stableSplit" $ do
      stableSplit [-3..3] `shouldBe` ([-3..(-1)], [0..3])
