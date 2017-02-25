
(p "Least Common Multiple")

(ghc "
lcm' a b = div (a * b) (gcd a b)
main = do
  print $ lcm' 15 5
" :str #t)
