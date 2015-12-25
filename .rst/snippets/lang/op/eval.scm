
(sh "eval \"echo $HOME\"")

(gosh (eval (read-from-string "(print 1)") (interaction-environment))
      :msg "read string as S expressions")

(gosh ((eval (string->symbol "print") (interaction-environment)) "HOGE"))

(gosh (let1 HOGE 1 (eval (read-from-string "(print HOGE)") (interaction-environment)))
      :warn "Can't refer local variables")

(gosh (let1 HOGE 1 (eval (read-from-string (format "(print ~a)" HOGE)) '()))
      :msg "Need to evaluate HOGE first")

(gosh
 (let ((lambda. lambda))
   ((eval `(,lambda. (arg) arg) (interaction-environment)) 123))
 :warn "Can't use lambda. as lambda")

(gosh (let ((lambda. ((with-module gauche.internal global-id) 'lambda)))
        ((eval `(,lambda. (arg) arg) (interaction-environment)) 123)))

;; def func(t):
;;     return 2 * t
;; with open("./rc.py") as f:
;;     exec(f.read() , locals())
;; print "a = {a}, b = {b}, c = {c}".format(**locals())

;; # percolは設定ファイルをexecで読み込んでいる
;; a = 1
;; b = "aiueo"
;; c = func(10)

