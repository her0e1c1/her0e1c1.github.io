(load-from-current-dirctory "include-sh.scm")

(ps "STDOUT")
(run "echo 'This text is not shown' > /dev/null")
(run "echo 'This text is not shown' 1>&2 /dev/null")
(run "echo hoge|rev")

(ps "Compare")
(p "-eq, -gt, are operators for number. NOT STRING!")
(pw "[ and ] need spaces around each of them")
(run "[ 1 -eq 1 ] && echo 'true'")
(run "[ 2 -gt 1 ] && echo 'true'")
(run "[ 2 -ge 2 ] && echo 'true'")
(run "[ 1 -lt 2 ] && echo 'true'")
(run "[ 2 -le 2 ] && echo 'true'")
(run "[ 'hoge' -eq 'hoge' ] && echo 'true'")

(pw "Not == operator")
(run "[ 'str' = 'str' ]     && echo 'true'")
(run "[ 'str' != 'string' ] && echo 'true'")
(run "[ 1 = 1 ]     && echo 'true'")
(p "Not quoted string")
(run "[ hoge = hoge ]     && echo 'true'")

;; ### String
;; # Execute string
;; eval "ls $HOME"

;; # let
;; a=1
;; let a=a+1

(ps "set!")
(run ": ${A=1} && echo $A")

(p "${NAME:=VAL} if variable is undefined, then set a value.")
(run ": ${NULL:='NULL'} && echo $NULL")

(p "${NAME:-VAL} if variable is undefined, then evaluate a value but not set it.")
(run "echo ${NULL:-'NULL'}")
(run ": ${NULL:-'NULL'}; echo $NULL")
(run "NULL='HOGE' && echo ${NULL:-'NULL'}")

(p "${NAME:=VAL} if variable is defined, then evaluate a value but not set it.")
(run "echo ${NULL:+'NULL AGAIN'}")


(ps "colon")
(p "colon(:) is similar to pass in Python")
(run "if true; then :; fi")
(pw "代入式などに使用する. コマンドを実行しないようにする")
(run "${A=1} && echo $A")

(ps "passArgsWithStdin")
(run "echo 'echo $1, $2'| sh /dev/stdin 100 1")
(p "better")
(run "echo 'echo $1, $2'| sh -s - 100 1")

(ps "function")
(p "declare minimum")
(run "f(){}")
(pw ";がないとエラー")
(run "f(){ echo 1 }; f")
(run "f(){ echo 1;}; f")

;; # {の後にspace必要。
(pw "need a space after {")
(run "f(){echo 1;} ;f")
(run "f(){ echo 1;};f")

(ps "string")
(run "cat <<EOS
This is a long string with new lines.
EOS")
(p "assign a var")
(run "VAR=$(cat <<EOS
This is a long string with new lines.
EOS
)
echo $VAR
")
(pw "変数を使いたい場合、変数展開されないようにする")
(run "VAR=1 && cat <<EOS
\\$VAR=$VAR
EOS")

(run "if true  ; then echo 'true'; else echo 'false'; fi")
(run "if false ; then echo 'true'; else echo 'false'; fi")
;; # How do I examine a variable in the best way?
;; A=true
;; if $A ; then echo "true!!"; fi
;; $A && echo 'true!!'

;; B=false
;; if $B ; then echo "true!!"; fi  # false
;; $B && echo 'true!!'  # false

;; # With test, [ ] or [[ ]] operators, bash conditions evaluate as true in case of an exit code of 0
;; if [ 0 ] ; then echo not null ; fi
;; if [ $(echo 0) ] ; then echo not null ; fi
;; if [ -z "" ] ; then echo null ; fi

(run "case 'apple' in a*) echo 'starts with a';; esac")
(run "case 'apple' in a*) echo 'starts with a';; esac")
(p "? is any one char")
(run "case 'Xapple' in ?a*) echo 'starts with a';; esac")
(run "case '' in '') echo 'empty string';; esac")
(run "case 'banana' in apple|banana) echo 'I want banana';; esac")

(p "Multi liners")
(for-each (^(i j)
         (run #"
if ~|i|; then
    echo 'if';
elif ~|j|; then 
    echo 'elif';
else
    echo 'else';
fi
"))
          '(true false false)
          '(false true false))

;; f(){
;;     # 等しいに文字列の=を使わない!
;;      [ $# -eq 1 ] && echo one
;;      [ $# -eq 2 ] && echo two
;;    }
;; f 1
;; f 1 2

;; #tag: color

;; # 複数の組み合わせをする場合は、;で区切る
;; echo -e "\e[1;31;42m Yes it is awful \e[0m"

;; # 以下のように、;でなくても一つ一つネストさせてよい
;; # \e[0mで全てキャンセルされるので、ネスト分だけ用意しなくてよい
;; echo -e "\e[1m\e[31;42m Yes it is awful \e[0m"
;; echo -e "\e[1m\e[31m\e[42m Yes it is awful \e[0m"

;; #tag: color

;; # 以下の区切り文字で囲むことで、その範囲の文字列の色を変更できる
;; # \033[数字m
;; # \033[0m

;; # 数値は以下の通り
;; # 30 黒文字
;; # 31 赤文字

;; # 40 黒背景
;; # 41 赤背景

;; # -e をつけないと、そのまま表示される(sh/bash)
;; echo -e "\033[31mRED FOREROUND\033[0m"
;; echo -e "\033[41mRED BACKGROUND\033[0m"



a="a b c"; set -- $a; for i in $a; do echo $i;done
# shellのsplitについて補足
# 文字列の分割は、 set -- $var で行う
# 初期値の区切り文字は、$IFS
echo -n $IFS | cat -vte
# ^I$
#^@

# zshだと上記でsplitできないのでechoで対応(互換あり)
a="a b c"; for i in `echo $a`; do echo $i;done

IFS=":"  # delimter
for p in $PATH; do echo "$p\n" ; done

# when you want to execute other commands, then use system 
echo `echo TEST`
echo $(echo TEST)

# You can nest commands if using $()
echo $(echo $(echo 1) 2) 3


test -z "$__THIS__IS__NOT__DEFINED" && echo "undefined"
# 定義を確認
test -n "$PATH" && echo "defined"
# shの注意
# 文字列として認識させるため"$VAR"とすること
# test -n a a && echo 1
# test -n "a a" && echo 1

# 一時ディレクトリを作成
mktemp -d  # /tmp/tmp.DC3v9kEX
