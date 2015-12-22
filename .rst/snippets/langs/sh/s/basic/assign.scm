(load-from-current-dirctory "include-sh.scm")

(ps "assign")
(run ": ${A=1} && echo $A")

(p "${NAME:=VAL} if variable is undefined, then set a value.")
(run ": ${NULL:='NULL'} && echo $NULL")

(p "${NAME:-VAL} if variable is undefined, then evaluate a value but not set it.")
(run "echo ${NULL:-'NULL'}")
(run ": ${NULL:-'NULL'}; echo $NULL")
(run "NULL='HOGE' && echo ${NULL:-'NULL'}")

(p "${NAME:=VAL} if variable is defined, then evaluate a value but not set it.")
(run "echo ${NULL:+'NULL AGAIN'}")
