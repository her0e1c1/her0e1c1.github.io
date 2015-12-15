
; :error filename 
; (process-output->string cmd :error (current-error-port))

 ;; (p cmd)
 ;; (flush)
 ;; (sys-system cmd)

; bに結果が溜まる
; s '(fold (^(a b) (cons a b)) ''() (i 10))'




; s '(filter ($ not $ even? $) (i 10))'
; s '(filter (.$ not even?) (i 10))'

; TODO: lazy let*
; (llet* ((a 1) (b 2)) (if #t a b))  ; 必要になってから評価

; 正規化あった
; (sys-normalize-pathname "~//a/./d/b" :expand #t :absolute #t :canonicalize #t)
; "/home/me/a/d/b"


; ((pa$ flip map) (iota 10) print)

; ((rxmatch) 1) ; => aに束縛とかよさげ?
; #"~a~b"
; (#/REGEX/ "strng")


; ... は 0 個を含む任意個の式 (,@の代わりっぽい)

; (guard (var cond) cddr)
; (guard (exc) 1)
; (guard (exc) (/ 1 0))
; (guard (exc (else 0)) (/ 1 0))

; 関数にすると、ローカル変数に代入する意味のないものになる
;; (define-macro (null! x)
;;   (guard (_ (else `(define ,x '())))
;;           x `(set! ,x '())))

; (lambda (it) BODY) => (--^ BODY)

(define-macro (import-only module . syms)
  `(begin
     ,@(map (lambda (sym) `(define ,sym (with-module ,module ,sym))) syms)))

(import-only gauche.internal extended-pair? extended-cons pair-attribute-get pair-attribute-set! pair-attributes)

; 結果違う
; (list->string (quote (#\a #\b)))
; (x->string (quote (#\a #\b)))

; (list->string (to #\あ #\ん))
; (char-set->list #[a-z])
; (char-set->list #[あ-ん])


; (df a (lcons* 1 2 3 (sys-sleep 10) 5))
; size-of
;; (define (len obj)
;;   (cond
;;    ((string? obj) (string-length obj))
;;    ((pair? obj) (length obj))
;;    (else 0)))


;; (p (peg-parse-string ($string "abc") "abc"))
;; (p (peg-parse-string ($char #\a) "abc"))
;; (p (peg-parse-string ($one-of #[a-z]) "cd"))
;; (p (peg-parse-string ($none-of #[a-z]) "A"))
; (p (peg-parse-string anychar "a"))
; (p (peg-parse-string digit "123"))


; (p (peg-parse-string anychar "a"))
; (p (peg-parse-string digit "123"))
; (p (peg-parse-string eof ""))
; (p (peg-parse-string anychar ""))
;; (P ($or ($string "abc")
;;          ($string "efg"))
;;     ; "abc"))
;;     "efg")
;; (p(equal? "bar"
;;             (pps
;;  ($try ($seq ($string "foo") ($string "bar")))
;;  "foobar")))

; $stringは、完全一致しないと、消費しない?
;; (P ($or ($string "abc")
;;         ($string "aef")
;;         )
;;    "aef")
;; (P ($or ($seq ($char #\a) ($char #\b))
;;         ($seq ($char #\a) ($char #\c))
;;         )
;;    "ab")
   ; "ac")  ; error

;; (P ($or ($try ($seq ($char #\a) ($char #\b)))
;;         ($seq ($char #\a) ($char #\c))
;;         )
;;    "ac")

; (pps ($do [x ($string "a")] [y ($string "b")] ($return (cons x y)) ) "ab")
; $lift は、パースの結果を使って、結果を新たに返す
;(pps ($lift cons ($string "a") ($string "b")) "ab")

; #[^a-b]
; (char-set-complement #[a-b])

;; (define-macro (rva a)
;;   `(recieve ret ,a ret))

; (define-values (a b . c) (values 1 2 3 4))


;; 標準出力を文字列に
;; (p (call-with-output-string
;;   (lambda (out) (write "HOGE" out))))

;; fileのportを受け取る
;; (call-with-output-file "./test.txt"
;;   (lambda (out) (write "this is a test" out)))

;; (with-output-to-file "./test.txt"
;;   (lambda () (print "this is a test")))
; s '($ p $ + 1 2 3)' => 6


; lazyしないと、内側で定義している%pがないと、言われる
; (define %w ($lazy ($lift (^[v _] v) ($or %p %ws) %ws)))
; $liftは、引数そろえないと！($lift (^(a b c) Pa Pb Pc))
; (define %w ($lazy ($lift (^[v] v) ($or %p %ws))))
; (define %w ($lazy ($lift (^[v] v) ($or %p))))

; (p (pps ($seq %c-f-body) "{a{b}c{d}e}"))


; (port-for-each 処理 read-line)
; (call-with-input-file "foo.txt" port->string)
; (call-with-input-file "foo.txt" port->string-list)
; (call-with-input-file "file" (lambda (in) something))
; (with-input-from-file "README.rst" (^() (port-for-each p read-line)))
; (dolist (line (call-with-input-file "Makefile" port->string-list)) (p line))
; (with-input-from-file "Makefile" (^() (p (read-line))))
