(load-from-current-dirctory "include-gauche.scm")

(ps "expand")
(p "|NAME|とすることで、文字をすぐ後ろへつなげる")
(gosh (let1 name 123 #"a test ~|name|."))
(p "reader macroの確認")
(gosh (let1 name 123 '#"a test ~|name|."))
(gosh #"~(+ 1 2 3)")

(gosh (string-every #\space "   "))
(gosh (string-null? ""))

(ps "number notation")
(gosh #b1111)
(gosh #o777)
(gosh #xffff)
(p "10 ^ 3  ; (expt 10 3)")
(gosh #e1e3)

(ps "format")
(p "~%改行")
(gosh (format #t "~D ~B ~O ~X~%" 256 256 256 256))
(gosh (format #f "~b ~b" #b1101001 100))

(gosh #\U1234)
;(gosh #\U12345678)

(gosh (make-string 5 #\ふ))
(gosh (substring "abc" 0 1))
(pw "error")
(gosh (substring "" 0 1))

(ps "index")
(gosh (~ "abc" 0))

(ps "length")
(gosh (string-length "あいうえお"))
(gosh (string-length "test"))

(gosh (string-trim-both " abc "))

(ps "join")
(gosh (string-join (list "a" "b" "c") "-"))

(gosh (string-append "abc" "def"))

(ps "tr")
;; ; stdinにしか使えない?
;; ; ls | s '((tr "a-z" "A-Z"))'
;; ; string使う
(gosh (string-tr "ABC" "AB" "00"))

(ps "serialize")
(p "オブジェクトを文字列にする")
(gosh (write-to-string '(1 foo "abc")))
(gosh (read-from-string "(1 foo \"abc\")"))
