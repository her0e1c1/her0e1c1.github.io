-- IMPLEMENT: findSqrtN (15241578750190521 = n * n)

-- 2 ^ xのときにf(x) = 0になるということは、2^xもbitに含まないといけない
-- f(x) = x * x - 4 のとき
-- x = 2でf(x) = 0となるが、0b100は答えにふくまれないといけない

-- max x st f(x) = x * x - n <= 0
-- 15241578750190521 = 123456789 * 123456789

f target = g where
  g acc x = let n = acc + (2 ^ x) in if (n * n) <= target then n else acc

-- reverse と大きい方から評価する必要あり

main = do
  print $ foldl (f 15241578750190521) 0 $ reverse [0..63] 
