
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
;; # check the arguments by last pid: 31275;  load averages:  0.71,  0.45,  0.36  up 15+17:15:24    00:27:03
1175 processes:1 running, 1174 sleeping

Mem: 258M Active, 34M Inact, 641M Wired, 10M Cache, 110M Buf, 26M Free
ARC: 135M Total, 5146K MFU, 46M MRU, 238K Anon, 4749K Header, 79M Other
Swap: 4096M Total, 887M Used, 3209M Free, 21% Inuse


  PID USERNAME    THR PRI NICE   SIZE    RES STATE    TIME    WCPU COMMAND
31075 me            1  52    0 49912K  4056K select   0:00   2.98% ssh-agent
31098 me            1  52    0 49912K  4068K select   0:00   2.98% ssh-agent
31029 me            1  52    0 49912K  4036K select   0:00   2.98% ssh-agent
31121 me            1  52    0 49912K  4080K select   0:00   2.98% ssh-agent
31144 me            1  52    0 49912K  4080K select   0:00   2.98% ssh-agent
31052 me            1  52    0 49912K  4036K select   0:00   2.98% ssh-agent
30833 me            1  52    0 49912K  4036K select   0:00   0.98% ssh-agent
30740 me            1  52    0 49912K  4036K select   0:00   0.98% ssh-agent
30902 me            1  52    0 49912K  4036K select   0:00   0.98% ssh-agent
30648 me            1  52    0 49912K  4036K select   0:00   0.98% ssh-agent
30948 me            1  52    0 49912K  4036K select   0:00   0.98% ssh-agent
30694 me            1  52    0 49912K  4036K select   0:00   0.98% ssh-agent
30784 me            1  52    0 49912K  4036K select   0:00   0.98% ssh-agent
30856 me            1  52    0 49912K  4036K select   0:00   0.98% ssh-agent
30994 me            1  52    0 49912K  4036K select   0:00   0.98% ssh-agent
30671 me            1  52    0 49912K  4036K select   0:00   0.98% ssh-agent
30879 me            1  52    0 49912K  4036K select   0:00   0.98% ssh-agent
30810 me            1  52    0 49912K  4036K select   0:00   0.98% ssh-agent
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

