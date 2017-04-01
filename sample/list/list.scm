(use gauche.test)

(define (last l)
  (cond ((null? l) '())
        ((null? (cdr l)) (car l))
        (else (last (cdr l)))))

(test* "last" 1   (last '(1)))
(test* "last" 3   (last '(1 2 3)))
(test* "last" '() (last '()))

(define (length* a)
  (if (null? a)
      0
      (+ 1 (length* (cdr a)))))
; '() のときは0が返ってきてほしい、それを初期値とする

(test* "length" 3 (length* '(1 2 3)))

(define (map* f ls)
  (if (null? ls)
      '()
      (cons (f (car ls)) (map* f (cdr ls)))))

(test* "map" '(1 4 9) (map* (lambda (x) (* x x)) '(1 2 3)))

(define (remove* a alist)
  (if (null? alist)
      '()
      (let ((head (car alist))
            (tails (remove* a (cdr alist))))
        (if (eq? a head)
            tails
            (cons head tails)))))
(test* "remove" '(2 3) (remove* 1 '(1 2 1 3)))
(test* "remove" '(1 2 1 3) (remove* 0 '(1 2 1 3)))

(define (reverse* alist)
  (if (null? alist) '()
      (append (reverse* (cdr alist)) (list (car alist)))))
(test* "reverse" '(3 2 1) (reverse* '(1 2 3)))

(define (elem? i items)
  (cond ((null? items) #f)
        ((eq? i (car items)) #t)
        (else (elem? i (cdr items)))))
(test* "elem?" #t (elem? 1 '(2 1 3 6 4 5)))
(test* "elem?" #f (elem? 9 '(2 1 3 6 4 5)))

(define (unique a)
  (if (null? a)
      '()
      (let ((head (car a)) (tails (unique (cdr a))))
        (if (elem? head tails)
            tails
            (cons head tails)))))
(test* "unique" '(2 1 3) (unique '(2 1 3)))
(test* "unique" '(2 3 1 5)   (unique '(5 1 2 3 1 5)))
