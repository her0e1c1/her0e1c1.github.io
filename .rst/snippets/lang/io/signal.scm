
(perl "say keys %SIG")


(sh "
trap 'echo C' SIGCHLD
sleep 1 &
echo P
wait
"
    :msg "catch the signal when a child process exit")
