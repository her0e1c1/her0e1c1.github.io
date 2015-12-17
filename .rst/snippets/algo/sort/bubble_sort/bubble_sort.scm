 (define (descend l a)
   (if (or (null? l) (< a (car l)))
       (cons a l)
       (cons (car l) (descend (cdr l) a))))

; 一つ前のソート済みの配列に、合致する位置に挿入
; f(n) = (descend f(n-1) a)
(define (bubble-sort l)
  (if (null? l) l
      (descend (bubble-sort (cdr l)) (car l))))
