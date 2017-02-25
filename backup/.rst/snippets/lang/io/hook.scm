
(p "zsh hook (chpwd precmd preexec periodic zshaddhistory zshexit)")
(let1
 path "hook.sh.tmp"
 (create-file-from-string path #!DOC EOS
autoload -U add-zsh-hook
function f1 { echo 1; }
function f2 { echo 2; }
function f3 { echo 3; }
function f4 { echo 4; }
add-zsh-hook precmd f1;
add-zsh-hook preexec f2;
add-zsh-hook chpwd f3;
add-zsh-hook zshexit f4;
echo hoge
\cd
echo foo
exit
EOS
)
 (zsh #"zsh ~path" :path path :msg "echo 1 at each command")
)


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
