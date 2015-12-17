-- IMPLEMENT: red black tree
-- 制約
-- ROOTは黒
-- LEAFは、黒のNIL
-- 赤は必ず子供をもち、黒でないといけない
-- 赤が２つ続いてはいけない
-- 黒の数はどの経路も同じ

data Color = R | B deriving Show

data Hash k v = Leaf
 | Node Color (Hash k v) (k, v) (Hash k v)
 deriving Show

turnB :: Hash k v -> Hash k v
turnB (Node R a x b) = (Node B a x b)
turnB x = x

insert :: Ord k => (k,v) -> Hash k v -> Hash k v
insert (k, v) a = turnB $ insert' k v a

insert' :: Ord k => k -> v -> Hash k v -> Hash k v
-- Nodeのときは挿入しない.Leafで、それを置き換えて挿入
-- 同じ値の場合は、無視される
insert' kx vx Leaf = Node R Leaf (kx, vx) Leaf
insert' kx vx (Node c l (k, v) r) = case compare kx k of
 LT -> balance c (insert' kx vx l) (k, v) r
 GT -> balance c l (k, v) (insert' kx vx r)
 EQ -> Node c l (k, v) r
 
balance :: Color -> Hash k v -> (k,v) -> Hash k v -> Hash k v
-- 再構築は赤親に挿入したとき
-- 曾孫がいるNodeのときに、マッチする
balance B (Node R (Node R a x b) y c) z d = Node R (Node B a x b) y (Node B c z d)
balance B (Node R a x (Node R b y c)) z d = Node R (Node B a x b) y (Node B c z d)
balance B a x (Node R b y (Node R c z d)) = Node R (Node B a x b) y (Node B c z d)
balance B a x (Node R (Node R b y c) z d) = Node R (Node B a x b) y (Node B c z d)
-- 4通り以外
balance c a x b = Node c a x b

fromList :: Ord k => [(k, v)] -> Hash k v
-- 関数を定義しているが、引数が１つでそれが最後の場合は、省略できる
fromList = foldl insert'' Leaf
insert'' :: (Ord k) => Hash k v -> (k, v) -> Hash k v
insert'' a (k, v) = insert (k, v) a

n1 = Node B Leaf (2, 1) Leaf
n2 = Node B Leaf (3, 1) Leaf
n3 = balance B (Node R n2 (2, 1) n1) (2, 1) n2
