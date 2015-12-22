(load-from-current-dirctory "include-gauche.scm")

;; (define (f n turn)
;;   (let ((ls (mod0 n)))
;;     (cond ((eq? ls '())
;;            (if turn
;;                #f
;;                #t))
;;           (turn
;;            (any (map
;;                  (lambda (x) (f (- n x) (not turn)))
;;                  ls)))
;;           (else
;;            (not (any (map
;;                  (lambda (x) (f (- n x) (not turn)))
;;                  ls)))))))
;; (define (mod0 n)
;;   (define (iter i ls)
;;     (cond ((= i n) ls)
;;           ((= (mod n i) 0)
;;            (iter (+ i 1) (cons i ls)))
;;           (else
;;            (iter (+ i 1) ls))))
;;   (cond ((< n 2) '())
;;         (else
;;          (iter 2 '()))))

;; ; キャッシュ機能
;; ; (define func (memorize func))
;; (define (memoize func)
;;  (let ((dp (make-hash-table 'equal?)))
;;    (lambda args
;;      (if (hash-table-exists? dp args)
;;          (hash-table-get dp args)
;;          (let ((value (apply func args)))
;;            (hash-table-put! dp args value)
;;            value)))))

;; - simple

;; closを利用しないと、データ構造のアクセス演算子がcar/cdrだけなので、よみにくい ::

;;    // 何が返るか、わからない
;;    (cadr human)

;;    // getterを実装するが、冗長
;;    (define (get-human-name human)
;;      (cadr human))
;;    (get-human-name human)

;;    // 以下のようにアクセスしたいのでCLOSを利用する
;;    (get-name human)  // human instanceに対して有効な関数get-name

;;    // letで名前をつけて、読みやすくする
;;    (let ((name (cadr human)))
;;       BODY)


;; (define (split-2 ls)
;;   (if (or (null? ls) (null? (cdr ls)))
;;       '()
;;       (cons (list (car ls) (cadr ls))
;;             (split-2 (cddr ls)))))


;; (define-macro (test-sequence . body)
;;   `(begin ,@(map (lambda (i) `(test* (quote ,(cadr i)) ,(car i) ,(cadr i)))
;;                  (split-2 body))))


;; ; 継続はある計算状態を保持することができる

;; (define return-apples '())

;; (define (get-apples)
;;   (print (append
;;    '(I have)
;;    (list (call/cc
;;      (lambda (cc)
;;     (set! return-apples cc)
;;     '2)))
;;    '(apples))))

;; (define (main argc)
;;   (let ((counter 0)
;;         (apple (get-apples)))
;;     (if (<= counter 5)
;;         (begin
;;           (set! counter (+ counter 1))
;;           (return-apples counter)))))

; racket
; 以下のようにしてimport
; (require srfi/27)
