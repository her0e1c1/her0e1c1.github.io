
(math "s $subseteq S s.t. $sum_{a_i $in s} a_i = 0")

(math "
f(0, 0) &=& ${ $phi $}
f(0, k) &=& $phi (k $neq 0)
f(n, k) &=& ${ cons(a_n, x) $mid x $in f(n-1, k-a_n) $} $cup f(n-1, k)
")

(ghc #!Q
f x = go x 0 where
 go [] 0 = [[]]
 go [] _ = []
 go (x:xs) k = map (x:) (go xs (k-x)) ++ go xs k
main = print $ f [1,2,-1,-2,3]
Q :str #t)

(math "s $subseteq S, s $neq $phi s.t. $sum_{a_i $in s} a_i = 0")
(ptodo "最後の要素を必ず使うようになってるのを修正")
(math "
f(1, a_1) &=& ${ a_1 $}
f(1, k) &=& $phi (k $neq a_1)
f(n, k) &=& ${ cons(a_n, x) $mid x $in f(n-1, k-a_n) $} $cup f(n-1, k)
")

(ghc #!Q
f x = go x 0 where
 go [x] k = if x == k then [[x]] else []
 go (x:xs) k = map (x:) (go xs (k-x)) ++ go xs k
main = print $ f [1,2,-1,-2,3]
Q :str #t)
