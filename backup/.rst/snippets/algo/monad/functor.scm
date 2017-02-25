
(p "関数の場合 fmap = (.)")

(ghc "((+1) <$> (*2) <$> (*3)) 1")
; (ghc "((+1) <$> (*2) <$>) Just 1")
(ghc "((+1) . (*2)) <$> Just 1")
(ghc "(+1) <$> (*2) <$> (+9) <$> (Just 1)")
(ghc "((+1) . (*2) . (+9)) <$> (Just 1)")

(p "モナドな値を普通の関数の引数にはできない。 そういうときは、functorを利用する")

(ghc "(2+) 3" :msg "関数の適用")
(ghc "(2+) (Just 3)" :msg "ラッパに入った値に対しては関数は適用できない")

(p "fmap:: (a -> b) -> f a -> f b (このfがモナドつまりラッパ)")
(ghc "fmap (2+) (Just 3)")

(p "<$ == fmap . const")
(ghc "1 <$ (Just \"abc\")")
(ghc "(fmap . const) 1 (Just \"abc\")")

(p ">> == (. const) . (>>=)")
(ghc "((. const) . (>>=)) (Just 1) (Just 2)")

(pw "文脈をもつ関数の合成は.でなく<$>")
(ghc "main = (print <$> (+1)) 1" :str #t)
(ghc "main = print $ (+1) <$> Just 1" :str #t)
(ghc "
import Control.Monad
p = print <$> (+)
main = return ()
" :warn "合成は引数１つの関数に限る" :str #t)
