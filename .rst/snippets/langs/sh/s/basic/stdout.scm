(load-from-current-dirctory "include-sh.scm")

(ps "STDOUT")

(run "echo 'This text is not shown' > /dev/null")
(run "echo 'This text is not shown' 1>&2 /dev/null")
(run "echo hoge|rev")
