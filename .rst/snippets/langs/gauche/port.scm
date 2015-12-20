

; ファイル読み込み
(call-with-input-file (string-append (home-directory) "/.emacs") port->string)
(call-with-input-file (string-append (home-directory) "/.emacs") port->string-list)

# port取得
ls |s '(current-input-port)'

# 3文字読む
s '(p (read-char) (read-char) (read-char))' <<< abcde

# 2行読む
ls|s '(p (read-line) " -- " (read-line))'

# port名
s '(port-name (current-input-port))'

# file string procのいずれか
s '(port-type (current-input-port))'
# file

# fileは、stdin stdout stderr
# 

# stdinは0のfileみたい
s '(port-file-number (current-input-port))'
# 0

# 文字列のportは#f
s '(port-file-number (open-input-string "test"))' 
# type stringとなる
s '(port-type (open-input-string "test"))'

# string portは、文字列を蓄積させていくことができる(buffに溜まるのかな)
s '(begin (define a (open-output-string)) (format a "test") (get-output-string a))'

; input/stdout/errorがttyに接続しているか?
(sys-isatty (standard-input-port))
(sys-isatty (standard-output-port))
(sys-isatty (standard-error-port))

# cpe 'P(isatty(10))'  ; 単純にwrapしてるだけ
# pipeを使うとttyでない(keyboardの入力ではない)

# ls |s '(sys-isatty (standard-input-port))'
# s '(sys-isatty (standard-output-port))' |cat
# s '(sys-isatty 1)'  ; 整数でも同じ


# ls|s '(sys-isatty 0)'
# name

# stdinでもkeyboard/pipeでttyが変わる
# s '(sys-ttyname 0)'  ; /dev/pts/10 (10からのstdin)
# ls|s '(sys-ttyname 0)'  ; #f

# オブジェクトを文字列にする
# (write-to-string '(1 foo "abc"))       ; => "(1 foo \"abc\")"
# 元に戻す
# (read-from-string "(1 foo \"abc\")")   ; => (1 foo "abc")


; 逆順
; ls|s "(port-fold cons '() read-line)"
