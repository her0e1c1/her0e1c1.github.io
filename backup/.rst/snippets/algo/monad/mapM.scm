
(ghc "
mapM' :: (Applicative m) => (a -> m b) -> [a] -> m [b]
mapM' f [] = pure []
mapM' f (x:xs) = (:) <$> f x <*> mapM' f xs
main = mapM' print [1..5] >> return ()
" :str #t)

(ghc #!Q
mapM' :: (Monad m) => (a -> m b) -> [a] -> m [b]
mapM' f = foldr (\a acc->do{x<-f a; xs<-acc; return (x:xs)}) $ return []
main = mapM' print [1..5] >> return ()
Q :str #t)

(ghc #!Q
mapM'_ :: (Applicative m) => (a -> m b) -> [a] -> m ()
mapM'_ f [] = pure ()
mapM'_ f (x:xs) = f x *> mapM'_ f xs
main = mapM'_ print [1..5]
Q :str #t)

(ghc #!Q
mapM'_ :: (Monad m) => (a -> m b) -> [a] -> m ()
mapM'_ f = foldr (\a acc->do{f a >> acc}) $ return ()
main = mapM'_ print [1..5]
Q :str #t)
