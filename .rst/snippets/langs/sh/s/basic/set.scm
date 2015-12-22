(load-from-current-dirctory "include-sh.scm")

(ps "set")

(run "a='a b c'; set -- $a; for i in $a; do echo $i;done")

(p"
shellのsplitについて補足
文字列の分割は、 set -- $var で行う
初期値の区切り文字は、$IFS
")

(run "echo -n $IFS | cat -vte")

(p "zshだと上記でsplitできないのでechoで対応(互換あり)")
(run "a='a b c'; for i in `echo $a`; do echo $i;done")

(p "delimter")
(run "IFS=':' && for p in $PATH; do echo $p ; done")
