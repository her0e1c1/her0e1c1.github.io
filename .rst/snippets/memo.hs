

groupBy f = foldr (\a acc->let (ys, zs) = span (f a) acc in (a:ys)++zs) []
do { msg <- Just ("hello"); (liftIO . putStrLn) msg; return msg}
f ~[x] = 0
-- f []だと実行時エラーでない
main = (print $ f 1) `catch` \(SomeException e) -> print "error"
