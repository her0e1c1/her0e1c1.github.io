
(p "(FUNC ARG1 ARG2 ... ARGN) => (funcall 'FUNC ARG1 ARG2 ... ARGN)")

(emacs (funcall '+ 1 2 3))
(emacs (funcall + 1 2 3))
(emacs (funcall (lambda (x y z) (+ x (* y z))) 1 2 3))
(emacs (funcall '(lambda (x y z) (+ x (* y z))) 1 2 3)
       :msg "lambdaのときは、'をつける必要なし ; ただしつけても同じ動作する")
(emacs (funcall '1+ 1 2)
       :warn "引数が期待される場合と異なるときはerror")
(emacs (progn (setq f (lambda (x) (* 2 x))) (funcall f 2))
       :msg "define a variable as lambda. you must call it with funcall")
(emacs (progn (setq f (lambda (x) (* 2 x))) (f 2)) :warn "ERROR")
