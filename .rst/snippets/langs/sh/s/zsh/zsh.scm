

;; # cat <<< "STRING"  # for zsh


;; # Parameter Expression
;; echo ${a:-a is not defined}
;; echo ${path:-this message is ignored}
;; echo ${a:=if a is not defined, then assign this}
;; echo ${a:=NOT CHANGED}
;; echo ${a:+if a is defiend, then show this instead}
;; echo ${abc:+if abc is not defiend, show empty string}
;; echo ${abc:? abc is not defined. so this program is stopped}


;; #tag: zsh

;; # 関数定義しただけでなく、実行もされる
;; (){echo "hello"}

;; # sh/bashは、匿名関数使えない
;; # 仕方がないので1回呼ぶので対応
;; a(){ echo "$1";}; a "hello world"



;; function echo_buffer {
;;     # string of the right side of current cursor
;;     echo "$LBUFFER" |tr -d " " |ls
;;     BUFFER=""  # refresh
;; }
;; zle -N echo_buffer
;; bindkey "^x" echo_buffer

;; function echo_buffer {
;;     echo hi
;; }
;; # Using add-zsh-hook
;; autoload -U add-zsh-hook
;; # add-zsh-hook (chpwd precmd preexec periodic zshaddhistory zshexit)
;; add-zsh-hook precmd echo_buffer

;; # Make associativ array named y
;; typeset -A y
;; y=(a 1 b 2 c 3)
;; echo $y  # 1 2 3
;; echo ${(@kv)y}  # a 1 b 2 c 3
;; echo ${(@k)y}  # a b c
;; echo ${(@v)y}  # 1 2 3
;; echo ${(@M)y}  # 1 2 3
;; echo $y[a]  # 1
;; echo ${${(@M)y}[1]}  # 1

;; typeset -a unique_list
;; unique_list=(1 2 3 4 1 2)
;; typeset -U unique_list
;; echo $unique_list  # 1 2 3 4

;; # N
;; # - Follow symbolink
;; # / Match directory 
;; # . Match file
;; echo /bin(N-/)  # /bin
;; echo /bin/sh(/)  #
;; echo /bin/sh(.)  # /bin/sh

;; # if a variable is defiend, then return 1
;; echo ${+path}  # 1
;; echo ${+pathpath}  # 0

;; # Relate b and B
;; typeset -T b B
;; b=1
;; echo $B  # 1

;; # Dump a variable
;; typeset -p A  # 


;; function a1 {
;;   BUFFER=""
;;   # Refresh the current buffer
;;   # Clear strings
;;   zle -Rc
;; }
;; zle -N a1
;; # bindkey "^x" a1


;; function a2 {
;;     POSTDISPLAY="post"
;;     zle -Rc
;; }
;; zle -N a2

;; function a3 {
;;     # accept-line executes string in BUFFER
;;     BUFFER="ls"
;;     zle accept-line
;; }
;; zle -N a3


;; echo $(echo ~)(:a)  # /home/USER
;; echo $(echo ~/.emacs.d)(:A)  # expand symbol link


;; # Read man zshexpan

;; data='a
;; b
;; c
;; d'
;; # split \n
;; echo ${(f)data}  # a b c d
;; echo $#data  # 7
;; echo ${(qf)data}  # a b c d
;; echo ${(qqf)data}  # 'a' 'b' 'c' 'd'
;; echo ${(qqqf)data}  # "a" "b" "c" "d"
;; echo ${(qqqqf)data}  # $'a' $'b' $'c' $'d'

;; # join ,
;; echo ${(j:,:)${(f)data}}  # a,b,c,d
;; # split ,
;; echo ${(s:,:)${(f)data}}  # a b c d

;; a="aaabc"
;; # この正規表現はa*と同じ意味で、マッチした文字を取り除く
;; echo ${a##a##}

;; # 変数代入
;; : ${a::=1}


;; #!/bin/sh

;; filepath=/home/usr/test.txt
;; # ##は、最長マッチした部分を除外
;; # base=$${filepath##*/}
;; base=${filepath##*/}
;; # text.txt

;; # you remove matching min string at the right side
;; parent=${filepath%/*}
;; # /home/usr

;; echo "path $filepath"
;; echo "dir ${filepath%/*}"
;; echo "base ${filepath##*/}"

;; echo "make a buckup file for $filepath"
;; echo $filepath{,.bak}

;; # Range from 1 to 10
;; echo "{1..10} =" {1..10}


;; # zsh lambda
;; () { ls }


;; #VARS1=($$ $0 $1 $2)
;; VARS1=(a b c d e)


;; # Don't insert spaces around = operator
;; #VARS1 = (a b c d e)

;; arr1=(1 2 3 4 5)

;; # Access index i of an array
;; echo "arr1[1] =" ${arr1[1]}

;; # You can't use (), which is an error
;; # for i in (1 2 3);do echo $i; done

;; # Multi liners
;; for i in ${VARS1[@]}; do
;;     echo $i;
;; done

;; # zshだと上記でsplitできないのでechoで対応(互換あり)
;; a="a b c"; for i in `echo $a`; do echo $i;done

;; # zshの特殊表記
;; a="a b c"; for i in ${(s/ /)a}; do echo $i;done
