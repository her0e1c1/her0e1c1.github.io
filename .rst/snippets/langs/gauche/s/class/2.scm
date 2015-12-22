
(define (make-cat name)
(let () 
  (define (say)
    (print name " says nya! nya!"))
  (define (dispatch msg)
    (cond ((eq? msg 'say) (say))))
  dispatch))

(define hanako (make-cat "hanako"))
(hanako 'say)
