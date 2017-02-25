
(run "python -c 'cons=lambda a,b: [a] + b; print(cons(1, [2,3]))'")
;; ghc -e '1:[2,3]'

(emacs (-cons* 1 2 3 4 5 '(6 7 8)))
(emacs (-snoc '(1 2 3) 4 5 6))

;; ; -snoc is not a destory function
;; (setq a2 '(1 2 3))
;; (-snoc a2 4)  ; '(1 2 3 4)
;; (-snoc a2 4 5 6)  ; '(1 2 3 4 5 6)
;; ; preappend
;; (setq a3 '(1 2 3))
;; (setq a3 (cons 4 a3))  ; (4 1 2 3)
