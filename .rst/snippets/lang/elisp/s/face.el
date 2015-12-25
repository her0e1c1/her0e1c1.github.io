
; face
; foreground  "black"
; background "red"
; underline t
; height 1.5
; width 
; box

; M-x list-faces-display
; M-x list-colors-display
(get-char-property (point) 'face)


(setq a (make-overlay 1 10))
(overlay-put a 'face 'warning)
(ov 1 10 'face 'warning)
(ov-clear)
(ov-set (ov-line) 'face '(:foreground "red") 'ov1 t)
(ov-set (ov-line) 'face '(:underline t) 'ov1 t)
(ov-set (ov-line) 'face '(:bold t) 'ov1 t)
(ov-set (ov-line) 'face 'any 'ov1 t)
(ov-set (ov-line) 'face '(:background "black") 'ov1 t)