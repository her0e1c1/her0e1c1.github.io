; narrowing <-> widening
; "C-x n n" makes narrowing enable in the region
; "C-x n w" make the region widen

; save current narrowing
(save-restriction
  (widen))


; Make a region narrowed
(narrow-to-region 1 10)

; canceal narrowing
(widen)

; check if buffer is narrowed
(buffer-narrowed-p)