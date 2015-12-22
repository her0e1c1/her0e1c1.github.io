(use srfi-42)

; Queensのデータ構造は
; '(k-1行目の列, k-2行目,,, 1行目, 0行目)
; とする。理由は, k行目を加えるときに(cons k '(k-1までの結果)) が使えるため

; なお答えは board-size <= 3の場合は、存在しない

(define (canAttack x queens)
  (let loop ((n 1) (q queens))
    (cond
     ((null? q) #f)
     ((= (+ x n) (car q)) #t)
     ((= (- x n) (car q)) #t)
     (else (loop (+ n 1) (cdr q))))))

(define (solveNQueen board-size)
  (let loop ((queens '()))
    (if (= (length queens) board-size)
        (list queens)
        (apply append
               (map (lambda (c) (loop (cons c queens)))
                    (filter (lambda (c)
                              (and (not (member c queens))
                                   (not (canAttack c queens))))
                            (list-ec (:range col board-size) col)))))))

(print (canAttack 1 '(0 3)))
(print (solveNQueen 4))
