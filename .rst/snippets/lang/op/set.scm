
(ps "assign")
(sh ": ${A=1} && echo $A")

(p "${NAME:=VAL} if variable is undefined, then set a value.")
(sh ": ${NULL:='NULL'} && echo $NULL")

(p "${NAME:-VAL} if variable is undefined, then evaluate a value but not set it.")
(sh "echo ${NULL:-'NULL'}")
(sh ": ${NULL:-'NULL'}; echo $NULL")
(sh "NULL='HOGE' && echo ${NULL:-'NULL'}")

(p "${NAME:=VAL} if variable is defined, then evaluate a value but not set it.")
(sh "echo ${NULL:+'NULL AGAIN'}")

(zsh ": ${a::=1}; echo $a")

;; echo ${a:-a is not defined}
;; echo ${path:-this message is ignored}
;; echo ${a:=if a is not defined, then assign this}
;; echo ${a:=NOT CHANGED}
;; echo ${a:+if a is defiend, then show this instead}
;; echo ${abc:+if abc is not defiend, show empty string}
;; echo ${abc:? abc is not defined. so this program is stopped}
