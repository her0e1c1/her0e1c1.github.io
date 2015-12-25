;tag: warn

; error
; (add-to-list '(1 2 3) 4)

; add-to-listは、必ず変数に対して実行する必要がある
(let ((a1 '(1 2 3)))
  (add-to-list 'a1 4)

  ; a bit long code without add-to-list
  ; 順番も逆
  (setq a1 (cons 5 a1)))


; -snoc is not a destory function
(setq a2 '(1 2 3))
(-snoc a2 4)  ; '(1 2 3 4)
(-snoc a2 4 5 6)  ; '(1 2 3 4 5 6)


; preappend
(setq a3 '(1 2 3))
(setq a3 (cons 4 a3))  ; (4 1 2 3)