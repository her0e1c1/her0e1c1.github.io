(load-from-current-dirctory "include-sh.scm")

(ps "undefined")

(run "test -z \"$__THIS__IS__NOT__DEFINED\" && echo \"undefined\"")

(p "定義を確認")

(run "test -n \"$PATH\" && echo \"defined\"")

(pw "shの注意 # 文字列として認識させるため\"$VAR\"とすること")

(run "test -n a a && echo 1")

(run "test -n \"a a\" && echo 1")
