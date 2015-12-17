data Heap a = Empty | Node a [Heap a] [Heap a]
 deriving (Show)

{-# INLINE heapsort #-}
heapsort :: (Ord a) => [a] -> [a]
heapsort = heapsortBy compare

{-# INLINE heapsortBy #-}
heapsortBy :: (a -> a -> Ordering) -> [a] -> [a]
heapsortBy cmp = toList . fromList
    where
        -- fromList :: [a] -> Heap a
        fromList = unify . map (\x -> Node x [] [])
        -- toList :: Heap a -> [a]
        toList Empty = []
        toList (Node x h t) = x:toList (unify $ h ++ reverse t)
        -- unify :: [Heap a] -> Heap a
        unify [] = Empty
        unify [x] = x
        unify (x:y:heaps) = merge (merge x y) (unify heaps)
        -- merge :: Heap a -> Heap a -> Heap a
        merge lhs Empty = lhs
        merge Empty rhs = rhs
        merge lhs@(Node x lh lt) rhs@(Node y rh rt)
            | cmp y x == LT = Node y (lhs:rh) rt
            | otherwise     = Node x lh (rhs:lt)

h1 = Node 1 [(Node 2 [] []), (Node 3 [Empty] [Empty])]