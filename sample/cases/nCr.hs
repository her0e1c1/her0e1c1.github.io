
-- MEMO: :Q:nCr
-- nCr = n-1Cr + n-1Cr-1 = (ある１つを除いた中からr個の組み合わせ) + (その１つを必ず用いて残りのr-1個による組み合わせ)
-- be careful of overflow
comb :: (Integral a) => a -> a -> a
comb n r
  | r == 0 || n == r = 1
  | 0 <= r && r <= n = comb (n-1) r + comb (n-1) (r-1)

main = print $ comb 5 2
