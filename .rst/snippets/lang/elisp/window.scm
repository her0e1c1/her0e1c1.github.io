; scroll-up(scroll-down)

;; ; 縦に分割
;; (split-window-horizontally)
;; ; 横に分割
;; (split-window-vertically)
;; ; 元の1画面に戻す
;; (keyboard-escape-quit)

;; (split-window)
;; (split-window nil nil t)
;; (one-window-p)
;; (windowp 1)
;; (other-window 1)
;; (other-window -1)

;; ; (x, y, width, height)
;; (window-edges (selected-window))

;; (with-selected-window (selected-window)
;;   (progn 1 2 3))

;; (recenter)
;; ; move curour to the first line of the window
;; (recenter 0)


;; ; Get frame width/heigh size, which is not window size
;; (display-pixel-width)
;; (display-pixel-height)

;; (frame-char-width)  ; 1
;; (frame-char-height)  ; 1




;;; interactive
(defun s1(s1 s2)
  "When you type M-x, then prompt pops up and asks 2 inputs of string. "
  (interactive "sEnter s1: \nsEnter s2: ")
  (message "you typed s1 = %s and s2 = %s" s1 s2))

(defun i1(beg end)
  "Mark a region and run this function so you get the two points of edges."
  (interactive "r")
  (message "point (begin, end) = (%s, %s)" beg end))

  ;; (split-window-horizontally)
  ;; (split-window-vertically)
