; return the a list of overlay objects in the region
(overlays-in (point-min) (point-max))
;(overlay-get )
;(delete-overlay ov)

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


; 背景色を変更
(set-background-color "Black")
(set-foreground-color "White")
(set-cursor-color "Gray")
