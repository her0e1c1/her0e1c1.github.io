(load-from-current-dirctory "include-sh.scm")


;; # 関数定義しただけでなく、実行もされる
;; (){echo "hello"}

;; # sh/bashは、匿名関数使えない
;; # 仕方がないので1回呼ぶので対応
;; a(){ echo "$1";}; a "hello world"


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

;; # Relate b and B
;; typeset -T b B
;; b=1
;; echo $B  # 1

;; # Dump a variable
;; typeset -p A  # 

;; # zsh lambda
;; () { ls }
