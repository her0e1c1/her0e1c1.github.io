
(p "when you want to execute other commands, then use system")

(ps "exec")

(p "execute shell command. you need -i option")
(run "perl -e 'system qq#sh -ic \"ll /lib/libc.so.*\"#'")

(p "System and go last")
(run "perl -E 'system \"echo TEST\" ;say \"print\"'")

(p "コマンドを実行し、失敗した場合にのみ制御が戻る")
(run "perl -E 'exec \"echo 1\" ;say \"NOT PRINTED\"'")

(p "when you want to execute other commands, then use system")
(run "perl -E 'say `echo TEST`'")
(run "perl -e 'system \"echo 1\" for 1..3'")


(sh "echo `echo TEST`")
(sh "echo $(echo TEST)")
(sh "echo $(echo $(echo 1) 2) 3" :msg "You can nest commands if using $()")

(ghc "System.Cmd.system $ \"echo \" ++ unwords [[x, '.'] ++ y | x <-['a'..'c'], y <- [\"csv\", \"txt\"]]")


(p "l list, v vector, e env")
;; ## execl (char*, char*, ...)
;; # command-path command-name arg1 arg2 ...
;; # the last argument must be NULL
;; ce 'execl("/bin/ls",  "/bin/ls", "-l", NULL);'  # ls -l
;; ce 'execl("/bin/ls",  "/bin/ls", NULL);'        # ls

;# execv (char*, char*[])
(p "exec path and its arguments. the list must be end with NULL.")
(c "execv(\"/bin/echo\", (char*[]){\"ECHO\", \"abc\", \"efg\", NULL});")
(c "execv(\"/bin/echo\", (char*[]){\"/bin/echo\", \"abc\", \"efg\", NULL});")
(c "execv(\"echo\", (char*[]){\"ECHO\", \"abc\", \"efg\", NULL});")

;; ## execlp execvp
(p "you don't need an absolute path because it searches PATH for the command.")
(c "execlp(\"echo\", \"ECHO\", \"hoge\", NULL);")
(c "execvp(\"echo\", (char*[]){\"ECHO\", \"hoge\", NULL});")

(gosh (sys-system "echo 1"))


(emacs (shell-command-to-string "echo 1"))
