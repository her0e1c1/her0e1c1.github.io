(load-from-current-dirctory "include-sh.scm")

(ps "exec")

(p "when you want to execute other commands, then use system")

(run "echo `echo TEST`")
(run "echo $(echo TEST)")

(p "You can nest commands if using $()")

(run "echo $(echo $(echo 1) 2) 3")
