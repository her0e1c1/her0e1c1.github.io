
(node "P(typeof a === 'undefined')")


(p "変数が未定義であることを確認")
(run "perl -E 'say \"undefined\" if !defined($a)'")
(p "未定義の場合に代入")
(run "perl -E '$a//=1; say $a'")


(sh "test -z \"$__THIS__IS__NOT__DEFINED\" && echo \"undefined\""
    :warn "shの注意 # 文字列として認識させるため\"$VAR\"とすること")

(p "定義を確認")
(sh "test -n \"$PATH\" && echo \"defined\"")
(sh "test -n a a && echo 1")
(sh "test -n \"a a\" && echo 1")


(zsh "echo ${+PATH}" :msg "if a variable is defiend, then return 1")
(zsh "echo ${+HOGEHOGE}")
