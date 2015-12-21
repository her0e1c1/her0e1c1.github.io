(load-from-current-dirctory "include-gauche.scm")

(ps "expand")
(p "|NAME|とすることで、文字をすぐ後ろへつなげる")
(runs (let1 name 123 #"a test ~|name|."))
(p "reader macroの確認")
(runs (let1 name 123 '#"a test ~|name|."))
(runs #"~(+ 1 2 3)")

(runs (string-every #\space "   "))
(runs (string-null? ""))

(ps "number notation")
(runs #b1111)
(runs #o777)
(runs #xffff)
(p "10 ^ 3  ; (expt 10 3)")
(runs #e1e3)

(ps "format")
(p "~%改行")
(runs (format #t "~D ~B ~O ~X~%" 256 256 256 256))
(runs (format #f "~b ~b" #b1101001 100))

(runs #\U1234)
;(runs #\U12345678)

(runs (make-string 5 #\ふ))
(runs (substring "abc" 0 1))
(pw "error")
(runs (substring "" 0 1))

(ps "index")
(runs (~ "abc" 0))

(ps "length")
(runs (string-length "あいうえお"))
(runs (string-length "test"))

(runs (string-trim-both " abc "))

(ps "join")
(runs (string-join (list "a" "b" "c") "-"))

(runs (string-append "abc" "def"))

(ps "tr")
;; ; stdinにしか使えない?
;; ; ls | s '((tr "a-z" "A-Z"))'
;; ; string使う
(runs (string-tr "ABC" "AB" "00"))

(ps "serialize")
(p "オブジェクトを文字列にする")
(runs (write-to-string '(1 foo "abc")))
(runs (read-from-string "(1 foo \"abc\")"))
