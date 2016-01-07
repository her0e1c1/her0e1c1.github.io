import Data.Monoid

-- The instance of Monoid must be satisfied below
-- (a `mappend` b) `mappend` c == a `mappend` (b `mappend` c)
-- mempty `mappend` a == a `mappend` mempty == a
-- mconcat = foldr mappend mempty

r1 = mempty :: [a] -- []
r2 = Sum 1 <> Sum 2 <> mempty  -- Sum 3
r3 = getSum $ mconcat  [Sum 1, mempty, Sum 2]
r4 = appEndo (Endo (+1) <> Endo (*2)) 10  -- 21
r5 = getSum $ maybe (Sum 0) id (mconcat [Just (Sum 1), Nothing, Just (Sum 2)])  -- 3
r6 = getFirst $ First Nothing `mappend` First (Just 1) `mappend` First Nothing  `mappend` First (Just 10)  -- Just 1
r7 = ((++"a") <> (++"b")) "c"  -- "cacb"
r8 = getSum $ ((+ Sum 10) <> (+ Sum 20)) 100  -- 230
-- r = 1 <> mempty  -- error
