

(ps "passArgsWithStdin")
(sh "echo 'echo $1, $2'| sh /dev/stdin 100 1")

(p "better")
(sh "echo 'echo $1, $2'| sh -s - 100 1")

(zsh "cat <<< 'STRING'")
