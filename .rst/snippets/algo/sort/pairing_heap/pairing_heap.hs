
data Heap a = Empty | Node a [Heap a]
 deriving (Show, Eq)

heapsort :: (Ord a) => [a] -> [a]
heapsort = toList . fromList

unify :: (Ord a) => [Heap a] -> Heap a
unify [] = Empty
unify [x] = x
unify (x:y:heaps) = merge (merge x y) (unify heaps)


-- 大きいものが上で、それより小さいものがリストとなる
-- リストの要素同士は順番ついていない
merge lhs Empty = lhs
merge Empty rhs = rhs
merge lhs@(Node x lheaps) rhs@(Node y rheaps)
 | compare x y == LT = Node y (lhs:rheaps)
 | otherwise         = Node x (rhs:lheaps) -- lheapsが右側なるので不安定ソート確定?

fromList :: (Ord a) => [a] -> Heap a
fromList = unify . map (\x -> Node x [])

toList :: (Ord a) => Heap a -> [a]
toList Empty = []
toList (Node x heaps) = x:toList (unify heaps)

h1 = Node 1 [(Node 2 []), (Node 3 [Empty])]