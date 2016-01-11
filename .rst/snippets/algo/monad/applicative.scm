
(p "
- ``fmap == <$>``
- ``fmap f x == f <$> x == pure f <*> x``
- ``f <$> m1 <*> m2`` <=> ``do {a1 <- m1; a2 <-m2; return (f a1 a2)}``
- ``(<$) :: Functor f => a -> f b -> f a``
- ``(<*>) :: Applicative f => f (a -> b) -> f a -> f b``
- ``pure :: Applicative f => a -> f a`` (return似ているが、monadoでなくapplicativeを返す)
- ``(*>) :: Applicative f => f a -> f b -> f b`` ((*>) は (>>) と同じで左の値は捨てて右の値だけ活かす。(<*) はその逆)
- ``(<*) :: Applicative f => f a -> f b -> f a``
")

(p "失敗してもよい。失敗したら次")
(ghc "Nothing <|> Just 2")
(ghc "Just 1 <|> Just 2")
(ghc "Nothing <|> Nothing :: Maybe Int")

(ghc "(+2) <$> (Just 1)")
(ghc "(+) <$> (Just 1) <*> (Just 2)")
(ghc "let f = (+) <$> (Just 1) in f <*> (Just 2)")
(ghc "(\\x y z-> x + y + z) <$> Just 1 <*> Just 2 <*> Just 3")
(ghc "(\\x y z-> x + y + z) <$> Just 1 <*> Nothing <*> Just 3")

(ghc "((\\x y z w->x + y + z + w) <*> (+3) <*> (+2) <*> (+1)) 1" :msg "全ての関数に引数1を渡す(+1自体も実行される)")
(ghc "((+2) *> (*2) <* (/2)) 10" :msg "apply only (*2)")
(ghc "((pure (+1)) <*> (*2)) 2" :msg "pure=constなので無視される")

(ghc "(\\x y z -> x + y + z) <$> Just 1 <*> Just 2 <*> Just 3")
(ghc "do
   x <- Just 1
   y <- Just 2
   z <- Just 3
   return (x + y + z)")
(ghc "do {a1<-(Just 1); a2<-(Just 2); a3<- (Just 3); return (a1 + a2 + a3)}")

(ghc "pure (+1) <*> (Just 1)")
(ghc "liftA (+1) (Just 1)")
(ghc "liftA2 (*) (Just 5) (Just 3)")

(ghc "1 <$ [\"a\"]")

(p "モナドの値に対してモナドの値を適用する. 文脈の関数を適用")
(ghc "Just (*5) <*> Just 3")
(ghc "liftA2 (*) (Just 5) (Just 3)")
(ghc "[(*2), (+3)] <*> [1, 2, 3]")

(ghc "Just 1 *> Just 2")
(ghc "Just 1 <* Just 2")
(ghc "Just 1 *> Just 2 *> Just 3 *> Just 4 <* Just 5 <* Just 6")
