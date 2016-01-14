
(p "mod nとした乱数生成関数fとし、x,yの2数を生成させ、対象の整数の因数を求める。(x=yとなった場合は失敗)")

(gosh #!Q
(define (polland n)
 (define rlist (shuffle (iota n)))
 (let1 f (^x (ref rlist x))
       (let loop ((x 2) (y 2))
         (let* ((x (f x))
                (y (f (f y)))
                (d (gcd (abs (- x y)) n)))
           (cond ((= d 1) (loop x y))
                 ((= d n) -1)
                 (else d))))))
(print (polland 108))
(print (polland 3))
Q :str #t)
