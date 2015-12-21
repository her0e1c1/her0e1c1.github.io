(load-from-current-dirctory "include.scm")
(define run oneliner-run+)


;; (+) 1 -1    (+) 1 (-1)

;; import Data.Bits(bitSize) size = bitSize 0"   size = bitSize (0 :: Int)   型を明示

;; maxInt maxBound::Int

;; (flip +)    (flip (+))  記号関数を引数にする場合、括弧が必要

;; read "10"
;; reads "10"   "read ""10"" :: Int
;; reads "10" :: [(Int, String)]"    型を指定する必要あり

;; do{x<-Just 1; return x+1}           do{x<-Just 1; return (x+1)}

;; f Just x = 1
;; f (Just x) = 1
;; 括弧がないと、関数fの引数が2つとる意味になる

;; [1,True]
;; [a]

;; (1::Int) == (1::Integer)
