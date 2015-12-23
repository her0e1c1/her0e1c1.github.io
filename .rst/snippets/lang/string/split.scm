
(node "P('a=1:b=2:c=3'.split(':').map(function(e){return e.split('=');}))")

(perl "say split /\s/, \"a b c\"")

(sh "a='a b c'; set -- $a; for i in $a; do echo $i;done"
    :msg "shellのsplitについて補足 文字列の分割は、 set -- $var で行う 初期値の区切り文字は、$IFS")

(zsh "a=\"a b c\"; for i in ${(s/ /)a}; do echo $i; done")
(zsh "A='a b c' && for i in ${(s: :)A}; do echo $i; done")
