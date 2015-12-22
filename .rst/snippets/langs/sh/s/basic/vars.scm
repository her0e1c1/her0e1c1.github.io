(load-from-current-dirctory "include-sh.scm")

(ps "var")

(run "echo $HISTSIZE")
(run "echo $PWD")
(run "echo $HOME")
(run "echo $OLDPATH")
(run "echo $SECONDS")

(p "getCurrentPID")
(run "echo $$")

;; f(){
;;     # 等しいに文字列の=を使わない!
;;      [ $# -eq 1 ] && echo one
;;      [ $# -eq 2 ] && echo two
;;    }
;; f 1
;; f 1 2
