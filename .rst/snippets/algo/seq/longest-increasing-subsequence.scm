
(p "数列{a_n}における、最長部分増加数列")

(math "f(n) = 1 + $max ${ f(k) $mid 1 $le k < n, a_k > a_n $} $cup ${ 0 $}")

(ghc #!Q
import Data.List (maximumBy)
f :: [Int] -> [Int]
f = g where
 c a b = compare (length a) (length b)
 -- g [] = []
 g (x:xs) = x : maximumBy c (map (h . flip drop xs) [0..(length xs)]) where
  h [] = []
  h ys = if head ys > x then g ys else []
main = print $ f [3,2,5,1,3,1,7,4]
Q :str #t)

(p "この方法では、計算量がO(n^2)となる。そこでbinary searchを使い、O(nlogn)に減らす")

(math "
f_{i+1} = $begin{cases} (f_i, a_{i+1}) & (f_{i, last} =< a_{i+1})
f_{i, x} := a_{i+1} & ($min_{a_{i+1} < f_{i,x}} x)
f_{i} & (else)
$end{cases}
")

(p "最小値は、2分木で探すことでlognで探せる")
