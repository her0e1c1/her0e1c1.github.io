
(perl "say keys %SIG")


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
