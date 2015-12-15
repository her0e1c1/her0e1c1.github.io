(load-from-current-dirctory "include.scm")

(p "l list, v vector, e env")
(p (sphinx-section "exel"))

;; ## execl (char*, char*, ...)

;; # command-path command-name arg1 arg2 ...
;; # the last argument must be NULL
;; ce 'execl("/bin/ls",  "/bin/ls", "-l", NULL);'  # ls -l
;; ce 'execl("/bin/ls",  "/bin/ls", NULL);'        # ls

;# execv (char*, char*[])
(p "exec path and its arguments. the list must be end with NULL.")
(run "execv(\"/bin/echo\", (char*[]){\"ECHO\", \"abc\", \"efg\", NULL});")
(run "execv(\"/bin/echo\", (char*[]){\"/bin/echo\", \"abc\", \"efg\", NULL});")
(run "execv(\"echo\", (char*[]){\"ECHO\", \"abc\", \"efg\", NULL});")

;; ## execlp execvp
(p "you don't need an absolute path because it searches PATH for the command.")
(run "execlp(\"echo\", \"ECHO\", \"hoge\", NULL);")
(run "execvp(\"echo\", (char*[]){\"ECHO\", \"hoge\", NULL});")
