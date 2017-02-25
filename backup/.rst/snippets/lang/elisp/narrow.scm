; narrowing <-> widening
; "C-x n n" makes narrowing enable in the region
; "C-x n w" make the region widen

(emacs (with-temp-buffer (narrow-to-region 1 2) (buffer-narrowed-p)) :warn "no string in buffer")
(emacs (with-temp-buffer (insert "hoge") (narrow-to-region 1 2) (buffer-narrowed-p)))
(emacs (with-temp-buffer (insert "hoge") (narrow-to-region 1 2) (widen) (buffer-narrowed-p)))
(emacs (with-temp-buffer (insert "hoge") (narrow-to-region 1 2) (save-restriction (widen)) (buffer-narrowed-p))
       :msg "save current narrowing with save-restriction")


