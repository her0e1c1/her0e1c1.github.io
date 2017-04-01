
-- MEMO: :Q:赤黒木のdata
data Color = B | R deriving Show
data Hash k v = Leaf | Node Color (Hash k v) (k, v) (Hash k v) deriving Show

turnB :: Hash k v -> Hash k v
turnB (Node R a x b) = Node B a x b
turnB x = x

-- 2分木と同じように挿入する
-- Leafで、それを置き換えて挿入
-- 同じ値の場合は、置き換える
-- MEMO:
insert' :: Ord k => k -> v -> Hash k v -> Hash k v
insert' k v Leaf = Node R Leaf (k, v) Leaf
insert' k v (Node c a (k', v') b) = case compare k k' of
  LT -> balance $ Node c (insert' k v a) (k', v') b
  GT -> balance $ Node c a (k', v') (insert' k v b)
  EQ -> Node c a (k, v) b

-- 再構築は赤親に挿入したとき
-- 曾孫がいるNodeのときに、マッチする
-- MEMO:
balance :: Ord k => Hash k v -> Hash k v
balance (Node B (Node R (Node R a x b) y c) z d) = (Node R (Node B a x b) y (Node B c z d))
balance (Node B (Node R a x (Node R b y c)) z d) = (Node R (Node B a x b) y (Node B c z d))
balance (Node B a x (Node R (Node R b y c) z d)) = (Node R (Node B a x b) y (Node B c z d))
balance (Node B a x (Node R b y (Node R d z c))) = (Node R (Node B a x b) y (Node B c z d))
balance x  = x

-- 関数を定義しているが、引数が１つでそれが最後の場合は、省略できる
-- MEMO:
fromList :: Ord k => [(k, v)] -> Hash k v
fromList = foldl insert Leaf
insert :: Ord k => Hash k v -> (k, v) -> Hash k v
insert x (k, v) = turnB $ insert' k v x

main = do
  print $ fromList [(1, "a"), (2, "b"), (3, "c"), (4, "d"), (5, "d"), (6, "e")]
