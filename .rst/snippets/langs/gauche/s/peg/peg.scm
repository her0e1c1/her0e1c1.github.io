(load-from-current-dirctory "include-gauche.scm")


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

; lazyしないと、内側で定義している%pがないと、言われる
; (define %w ($lazy ($lift (^[v _] v) ($or %p %ws) %ws)))
; $liftは、引数そろえないと！($lift (^(a b c) Pa Pb Pc))
; (define %w ($lazy ($lift (^[v] v) ($or %p %ws))))
; (define %w ($lazy ($lift (^[v] v) ($or %p))))
; (p (pps ($seq %c-f-body) "{a{b}c{d}e}"))
