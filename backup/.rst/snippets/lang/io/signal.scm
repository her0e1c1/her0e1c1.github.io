
(perl "say join q/, /, keys %SIG")


(sh "
trap 'echo C' SIGCHLD
sleep 1 &
echo P
wait
"
    :msg "catch the signal when a child process exit")

(sh "
set -e
trap 'echo EXIT' EXIT
echo 1
false && false
echo 2
false && true
echo 3
false
echo 4
" :str #t :warn "ignore false && false ???")


(sh "
set -e
1
echo 1
" :str #t)
(sh "
set -e
1 && ls HOGE
echo 1
" :str #t :warn "ignore an error")

(sh "
set -e
trap 'echo EXIT' EXIT
echo 1
false || true
echo 2
false || false
echo 3
" :str #t)

(sh "[ `ls` ] && echo OK" :warn "SYNTAX ERROR!")
(sh "[ -n \"`ls`\" ] && echo OK" )
(sh "[ -z \"`ls HOGE`\" ] && echo NO" )
