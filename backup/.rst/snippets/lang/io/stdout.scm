
(ps "STDOUT")
(sh "echo 'This text is not shown' > /dev/null")
(sh "echo 'This text is not shown' 1>&2 /dev/null")
