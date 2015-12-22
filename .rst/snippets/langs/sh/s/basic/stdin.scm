(load-from-current-dirctory "include-sh.scm")

(ps "passArgsWithStdin")

(run "echo 'echo $1, $2'| sh /dev/stdin 100 1")

(p "better")
(run "echo 'echo $1, $2'| sh -s - 100 1")
