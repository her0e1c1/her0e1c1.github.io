
(run "echo '1\n2\n3' | ruby -e 'while s=STDIN.gets; puts s end'")

(ps "passArgsWithStdin")
(sh "echo 'echo $1, $2'| sh /dev/stdin 100 1")

(p "better")
(sh "echo 'echo $1, $2'| sh -s - 100 1")

(zsh "cat <<< 'STRING'")

(run #!Q echo "test hoge"| ce 'char a[10], b[10]; scanf("%s %s", a, b); p(a); p(b);' Q
 :warn "buffer overrunの危険性はあるが、簡単な入出力方法")
