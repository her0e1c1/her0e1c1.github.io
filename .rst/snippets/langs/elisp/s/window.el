
(split-window)
(split-window nil nil t)
(one-window-p)
(windowp 1)
(other-window 1)
(other-window -1)

; (x, y, width, height)
(window-edges (selected-window))

(with-selected-window (selected-window)
  (progn 1 2 3))

(recenter)
; move curour to the first line of the window
(recenter 0)


; Get frame width/heigh size, which is not window size
(display-pixel-width)
(display-pixel-height)

(frame-char-width)  ; 1
(frame-char-height)  ; 1