(load-from-current-dirctory "include-sh.scm")

;; # Parameter Expression

;; echo ${a:-a is not defined}
;; echo ${path:-this message is ignored}
;; echo ${a:=if a is not defined, then assign this}
;; echo ${a:=NOT CHANGED}
;; echo ${a:+if a is defiend, then show this instead}
;; echo ${abc:+if abc is not defiend, show empty string}
;; echo ${abc:? abc is not defined. so this program is stopped}

