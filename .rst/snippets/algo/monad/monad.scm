
(ghc #!Q
import Control.Monad (guard)
ptriples = do
    a <- [1..]
    b <- [1..a]     -- b <= a
    c <- [a..a+b]   -- 直角三角形c を斜辺とすれば a <= c かつ三角不等式より c <= a+b
    guard (a*a + b*b == c*c)
    return (b,a,c)  -- 小さい数から並べる
main = mapM_ print $ take 5 ptriples
Q :str #t)
