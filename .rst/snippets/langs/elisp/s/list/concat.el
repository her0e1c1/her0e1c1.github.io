(-concat '(1 2 3) '(4) '(5 6 7))  ; (1 2 3 4 5 6 7)

; error if args contains atom
; (-concat '(1 2 3) 4 '(5))