(load-from-current-dirctory "include-sh.scm")

(ps "colon")
(p "colon(:) is similar to pass in Python")
(run "if true; then :; fi")
(pw "代入式などに使用する. コマンドを実行しないようにする")
(run "${A=1} && echo $A")
