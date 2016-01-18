
(ps "株価の儲けの最大を求める")

(p "差を求めて、それに対してKadane’s algorithを適用")

(math "
d(i) = f(i+1) - f(i) (1 $le i $le n - 1)
g(i) = (m_i, s_i)
s_1 = m_1 = d(1)
s_i = $max ${d(i), s_{i-1} + d(i) $}
m_i = $max ${m_{i-1}, s_i$}
")

(ghc #!Q
f (x:y:xs)= g (x-y) (x-y) (y:xs) where
 g s m [x] = max m 0
 g s m (x:y:xs) = g ns nm (y:xs) where
  d  = x - y
  ns = max d (s + d)
  nm = max m ns
main = do
 print $ f $ reverse [4,1,2,5,3]
 print $ f $ reverse [5,4,3,2,1]
Q:str #t)
