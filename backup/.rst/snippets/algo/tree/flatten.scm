
(define (flatten tree)
  (cond ((null? tree) '())
         ((pair? tree)
          (append (flatten (car tree))
                  (flatten (cdr tree))))
         (else (list tree))))

(define t1 '(a (b (c d) e) (f g) h))
(print
(flatten t1)
)


;; -- squishの第二引数は結果を保持
;; data Tree a = Node a [Tree a] deriving Show
;; flatten :: Tree a -> [a]
;; flatten t = squish t []
;;   where squish (Node x ts) xs = x:foldr squish xs ts

(define (flatten tree)
  (fold (lambda (x acc)
          (append acc (if (pair? x)
                          (flatten x)
                          (list x))))
        '()
        tree))

(define t1 '(a (b (c d) e) (f g) h))

(print
(flatten t1)
)
