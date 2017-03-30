-- nCr

comb :: (Integral a) => a -> a -> a
comb n r
  | r == 0 || n == r = 1
  | 0 <= r && r <= n = comb (n-1) r + comb (n-1) (r-1)

main = print $ comb 5 2
