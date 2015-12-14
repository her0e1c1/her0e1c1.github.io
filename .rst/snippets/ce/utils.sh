HERE=$(dirname $0)
cat <<EOS

;; ## cat
;; # getchar(void)は、標準入力から読み込む
;; # 全て出力
;; # while(char c = getchar())に宣言しても{}の中から参照できない
;; # それから一文字ずつ取り出しているが、処理は気になるほど遅くならない(要負荷試験)
;; ls | ce 'char c;while((c=getchar())>0){printf("%c", c);}'
;; # 1ファイルのみ
;; ls | ce 'char c;while((c=getchar())>10){printf("%c", c);}'


;; # stderroの方が出力が早いみたい
;; ce 'fprintf(stdout, "stdout"); fprintf(stderr,"error");'  # errorstdout
;; # stdoutを先に出力させる
;; ce 'fprintf(stdout, "stdout"); fflush(stdout); fprintf(stderr,"error");'  # stdouterror


;; # ttyはターミナルの入出力において、標準入力がキーボード、標準出力・エラーがディスプレイである

;; # isatty fdがttyであれば1を返す
;; # isatty(STDIN_FILENO)を使うことでuserが入力できる状態か判別できる
;; ce 'printf("%s", isatty(STDIN_FILENO) ? "tty" : "no tty");'  # tty
;; # 標準入力がキーボードでないので、ttyではない
;; ls | ce 'printf("%s", isatty(STDIN_FILENO) ? "tty" : "no tty");'  # no tty

;; # 標準出力がディスプレイであるか判別
;; ce 'printf("%s", isatty(STDOUT_FILENO) ? "tty" : "no tty");'  # tty
;; # ディスプレイでない場合はファイルやパイプなどを介す必要がある
;; ce 'printf("%s", isatty(STDOUT_FILENO) ? "tty" : "no tty");'  | cat  # no tty

;; unistd
;; # sysconf
;; # ARG_MAX
;; # 「実行するコマンド名 + 引数 + 子プロセスに渡す環境変数」の文字列長の最大値
;; ce 'printf("%ld", sysconf(_SC_ARG_MAX));'  # 262144
;; getconf ARG_MAX  # 262144
;; sysctl -A kern.argmax  # 262144


;; # ignore argument except first but you should not run this
;; ce 'execl("/bin/ls", "-l", NULL);'
;; # if error occors, return the code
;; ce 'printf("error code is %d", execl("/bin/"));'
;; # if no error, no code are executed after the execl
;; ce 'execl("/bin/ls", "/bin/ls", NULL); printf("NOT PRINTED");'
;; # check the arguments by `top -a`
;; ce 'execl("/usr/bin/perl", "perl is runnning", "-e", "$ s += $_ for 1..100000000; print $ s",  NULL);'

;; ## execle execve
;; # 多分、環境変数を上書きする。ただしPATHを変更してもpと同じように動かないみたい。
;; ce 'execle("/usr/bin/perl", "perl", "-e", "print $ ENV{TEST}", NULL, (char*[]){"TEST=/bin"});'

========
 Utils
========

$(go <<EOG
 (define (run cmd)
   (p (sphinx-block (format "$ ce '~a'\n~a" cmd (run-ce cmd)) :code-block "sh")))

 (p (sphinx-section "statfs"))
 ;; mount info
 (run "struct statfs s; statfs(\"/home\", &s); p(\"%s\", s.f_mntonname);")


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


EOG
)

EOS
