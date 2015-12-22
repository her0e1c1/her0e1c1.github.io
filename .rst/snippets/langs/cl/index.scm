(eq 'test 'test)  ; T

(eq '(1 2 3) '(1 2 3))  ; NIL
(eql '(1 2 3) '(1 2 3))  ; NIL
(equal '(1 2 3) '(1 2 3))  ; T

(eq 1.0 1.0)  ; T or NIL
(eql 1 1)  ; T
(eql 1 1.0)  ; F
(equal 1 1)   ; T
(equalp 1 1.0)   ; T

(string 'test)  ; "test"


(concatenate 'list '(a b) '(c d))  ; '(a b c d)
(concatenate 'string "Hello " "World.")  ; "Hello World."


; apply needs the last argument as a list
(apply #'+ 1 2 3 '(4))  ;10
(apply '+ 1 2 3 '(4))  ;10
(apply (symbol-function '+) 1 2 3 '(4))  ; 10
(apply (lambda (x y z w) (+ x y z w)) 1 2 3 '(4))  ; 10
(apply #'(lambda (x y z w) (+ x y z w)) 1 2 3 '(4))  ; 10
;(apply '(lambda (x y z w) (+ x y z w)) 1 2 3 '(4))  ; error

; funcall needs to know the number of argument
(funcall #'+ 1 2 3)

(setq inc (lambda (x) (+ x 1)))
; (inc 1)  ; error
(funcall inc 1)  ; 2
(funcall (symbol-value 'inc) 1)  ; 2  ; inc is not function but variable!
; warning (symbol-function 'inc) is error

(symbol-name '+)  ; "+"





(require 'cl)

(lexical-let ((x 2))
  (setq p (delay (* x 10))))

(force p) ;=> 20
(setq x 50)
(force p) ;=> 20
(setq x 1)
(force p) ;=> 20

,@は連結　括弧を取る

(setq some-list '(2 3))
     => (2 3)
(cons 1 (append some-list '(4) some-list))
     => (1 2 3 4 2 3)
`(1 ,@some-list 4 ,@some-list)
     => (1 2 3 4 2 3)

(setq list '(hack foo bar))
     => (hack foo bar)

(cons 'use
  (cons 'the
    (cons 'words (append (cdr list) '(as elements)))))
     => (use the words foo bar as elements)
`(use the words ,@(cdr list) as elements)
     => (use the words foo bar as elements)

   


(defmacro inc-list (ls)
     (mapcar '1+ ls))

一見すると ::

   (inc-list '(1 2 3))

が動きそうな気もするが, 実際は ::

   (mapcar '1+ ''(1 2 3))

を実行するのでエラーとなる.
``''(1 2 3)``というシンボルを代入しているのであってリストではない.




(typecase 1
  (number (print "type of number")))

;; (typecase "string"
;;   (string (print "type of number")))

(car nil)  ; NIL
(cdr nil)  ; NIL


(destructuring-bind (x y z) '(1 2 3) (+ x y z))
(destructuring-bind ((x) y z) '(1 2 3) (+ x y z))
(destructuring-bind ((x) y z . w) '((1) 2 3 . 4) (+ x y z w))


; Show system memory
(room)

(prog1 1 2 3)  ; 1
(prog2 1 2 3)  ; 2
(progn 1 2 3)  ; 3

(format nil "~:D" 1000) ; "1,000"
(format nil "~D" 1000)  ; "1000"



custom:*load-paths*  ; (#P"./" "~/lisp/**/")

; How long is the expression
(time (dotimes (i 1000000)))
;Real time: 1.034592 sec.
;Run time: 1.034559 sec.
;Space: 1392 Bytes
;NIL

; Delete symbol
(setq test 1)
(unintern 'test)
; test  ; error

(plusp 1)  ; T
(plusp 0)  ; NIL



(make-array 2)  ; #(NIL NIL)
#(1 1 1)




(make-pathname :defaults "/a/b/c.xxx" :type "yyy") ; #P"/a/b/c.yyy"
(make-pathname :defaults "/a/b/c.xxx" :name "kkk") ; #P"/a/b/kkk.xxx"
(make-pathname :defaults "/a/b/c.xxx" :directory "k") ; #P"/k/c.xxx"

(truncate 123 10)  ; 12
(truename "./")
