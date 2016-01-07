
-- f <$> m1 <*> m2
-- do {a1 <- m1; a2 <-m2; return (f a1 a2)}
-- f <$> x = pure f <*> x
-- 失敗してもよい。失敗したら次


a1 = Nothing <|> Just 2 -- Just 2
a2 = Just 1 <|> Just 2 -- Just 1
a3 = Nothing <|> Nothing -- Nothing


import Control.Applicative
r1 = (+) <$> Just 1
r2 = r1 <*> Just 2  -- Just 3
r3 = (\x y z-> x + y + z) <$> Just 1 <*> Just 2 <*> Just 3  -- Just 6
r4 = (\x y z-> x + y + z) <$> Just 1 <*> Nothing <*> Just 3  -- Nothing
-- 全ての関数に引数1を渡す
r5 = ((\x y z w->x + y + z +w)<*>(+3)<*>(+2)<*>(+1)) 1
r6 = ((+2) *> (*2) <* (/2)) 10
-- pure=constなので無視される
r7 = ((pure (+1)) <*> (*2)) 2


import Control.Applicative
-- fmap == <$>
r1 = (\x y z -> x + y + z) <$> Just 1 <*> Just 2 <*> Just 3 -- Just 6
-- 逐次 <*>
r2 = do
   x <- Just 1
   y <- Just 2
   z <- Just 3
   return (x + y + z)

r3 = do {a1<-(Just 1); a2<-(Just 2); a3<- (Just 3); return (a1 + a2 + a3)}

-- fmap g x = pure g <*> x
r4 = pure (+1) <*> (Just 1)
a4 = liftA (+1) (Just 1)
r5 = liftA2 (*) (Just 5) (Just 3)  -- (Just 15)

-- (<$) :: Functor f => a -> f b -> f a
f1 = 1 <$ ["a"] -- [1]



-- モナドの値に対してモナドの値を適用する

-- 文脈の関数を適用
-- (<*>) :: Applicative f => f (a -> b) -> f a -> f b
r1 = Just (*5) <*> Just 3
-- liftA2 (*) (Just 5) (Just 3)
r2 = [(*2), (+3)] <*> [1, 2, 3]  -- [2, 4, 6, 4, 5, 6]

-- (*>) は (>>) と同じで左の値は捨てて右の値だけ活かす。(<*) はその逆
-- (*>) :: Applicative f => f a -> f b -> f b
-- (<*) :: Applicative f => f a -> f b -> f a
r3 = Just 1 *> Just 2  -- Just 2
r4 = Just 1 <* Just 2  -- Just 1
r5 = Just 1 *> Just 2 *> Just 3 *> Just 4 <* Just 5 <* Just 6  -- Just 4

-- return似ているが、monadoでなくapplicativeを返す
-- pure :: Applicative f => a -> f a
