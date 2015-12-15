
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
;; # check the arguments by last pid: 75376;  load averages:  0.17,  0.27,  0.28  up 16+09:48:34    01:01:20
1575 processes:1 running, 1565 sleeping, 7 stopped, 2 zombie

Mem: 177M Active, 31M Inact, 725M Wired, 8180K Cache, 110M Buf, 30M Free
ARC: 158M Total, 20M MFU, 54M MRU, 272K Anon, 6456K Header, 78M Other
Swap: 4096M Total, 1322M Used, 2774M Free, 32% Inuse


  PID USERNAME    THR PRI NICE   SIZE    RES STATE    TIME    WCPU COMMAND
78052 me            2  30    0   329M 91656K select  24:11   0.98% emacs --daemon -q -l /home/me/github/emacs.d/.emac
77135 me            1  20    0 46420K  7636K select  10:12   0.98% tmux: server (/tmp/tmux-1001/default) (tmux)
77103 me            1  20    0 86084K  2000K select   1:01   0.00% sshd: me@pts/0 (sshd)
77584 me            2  25    0   271M 30152K select   0:08   0.00% emacs --daemon (emacs-24.5)
77163 me            2  52    0   269M 29492K select   0:07   0.00% emacs --daemon -q -l /home/me/github/emacs.d/.emac
77453 me            2  24    0   269M 29624K select   0:07   0.00% emacs --daemon -q -l /home/me/github/emacs.d/.emac
77004 pgsql         1  20    0 39268K  2348K select   0:06   0.00% postgres: stats collector process    (postgres)
48702 me            1  29    0 37476K     0K pause    0:03   0.00% -zsh (<zsh>)
77003 pgsql         1  20    0   180M  2560K select   0:03   0.00% postgres: autovacuum launcher process    (postgres
76998 pgsql         1  20    0   180M  2464K select   0:03   0.00% /usr/local/bin/postgres -D /usr/local/pgsql/data
66026 me            1  33    0 37596K  4496K ttyin    0:03   0.00% zsh
59325 me            1  20    0 37604K     0K pause    0:02   0.00% zsh (<zsh>)
77002 pgsql         1  20    0   180M  2344K select   0:01   0.00% postgres: wal writer process    (postgres)
61725 me            1  20    0 37476K     0K pause    0:01   0.00% -zsh (<zsh>)
77001 pgsql         1  20    0   180M  2356K select   0:01   0.00% postgres: writer process    (postgres)
77192 me            1  20    0 37604K     0K pause    0:01   0.00% -zsh (<zsh>)
66522 me            1  52    0 83964K     0K STOP     0:00   0.00% gosh -l /home/me/lib/scheme/init.scm (<gosh>)
63888 me            1  38    0 31092K     0K pause    0:00   0.00% zsh (<zsh>)
;; ce 'execl("/usr/bin/perl", "perl is runnning", "-e", "$ s += ce for 1..100000000; print $ s",  NULL);'

;; ## execle execve
;; # 多分、環境変数を上書きする。ただしPATHを変更してもpと同じように動かないみたい。
;; ce 'execle("/usr/bin/perl", "perl", "-e", "print $ ENV{TEST}", NULL, (char*[]){"TEST=/bin"});'

========
 Utils
========



statfs
======


.. code-block:: sh
   

    $ ce 'struct statfs s; statfs("/home", &s); p("%s", s.f_mntonname);'
    /



unistd
======

stdin 0, stdout 1, stderr 2
in this case, because I run this command as subprocess, these results are NULL.

.. code-block:: sh
   

    $ ce 'p("%s", ttyname(0));'
    (null)


.. code-block:: sh
   

    $ ce 'p("%s", ttyname(1));'
    (null)


.. code-block:: sh
   

    $ ce 'p("%s", ttyname(2));'
    (null)

l list, v vector, e env


exel
====

exec path and its arguments. the list must be end with NULL.

.. code-block:: sh
   

    $ ce 'execv("/bin/echo", (char*[]){"ECHO", "abc", "efg", NULL});'
    abc efg
    


.. code-block:: sh
   

    $ ce 'execv("/bin/echo", (char*[]){"/bin/echo", "abc", "efg", NULL});'
    abc efg
    


.. code-block:: sh
   

    $ ce 'execv("echo", (char*[]){"ECHO", "abc", "efg", NULL});'
    

you don't need an absolute path because it searches PATH for the command.

.. code-block:: sh
   

    $ ce 'execlp("echo", "ECHO", "hoge", NULL);'
    hoge
    


.. code-block:: sh
   

    $ ce 'execvp("echo", (char*[]){"ECHO", "hoge", NULL});'
    hoge
    



exit
====


.. code-block:: sh
   

    $ ce 'p("%d", EXIT_SUCCESS);'
    0


.. code-block:: sh
   

    $ ce 'p("%d", EXIT_FAILURE);'
    1


.. code-block:: sh
   

    $ ce 'exit(EXIT_SUCCESS); p("NOT REACHED");'
    



env
===


.. code-block:: sh
   

    $ ce 'p("%s", getenv("USER"));'
    me

NULL if the name doesn't exist.

.. code-block:: sh
   

    $ ce 'p("%s", getenv("user"));'
    (null)

