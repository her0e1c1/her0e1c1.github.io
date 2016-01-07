
-- ptriples.hs
import Control.Monad  -- guard関数を使うため

ptriples = do
    a <- [1..]
    b <- [1..a]     -- b <= a
    c <- [a..a+b]   -- c を斜辺とすれば a <= c かつ三角不等式より c <= a+b
    guard (a*a + b*b == c*c)
    return (b,a,c)  -- 小さい数から並べる

main = mapM_ print ptriples
