(defun f-kw(&key a b c)
  (list a b c))
;(test 1 2 3)  ; error 
(f-kw :a 1)   ; (1 NIL NIL)
(f-kw :b 2 )  ; (NIL 2 NIL)
(f-kw :a 1 :b 2 :c 3)   ; (1 2 3)

; Set initial values to arguments
(defun f-kw2(&key (a 1) (b 2) (c NIL))
  (list a b c))
(f-kw2 :b 3)  ; (1 3 NIL)

; Also set key
(f-kw2 :b :a)  ; (1 :A NIL)