
;;; interactive
(defun s1(s1 s2)
  "When you type M-x, then prompt pops up and asks 2 inputs of string. "
  (interactive "sEnter s1: \nsEnter s2: ")
  (message "you typed s1 = %s and s2 = %s" s1 s2))

(defun i1(beg end)
  "Mark a region and run this function so you get the two points of edges."
  (interactive "r")
  (message "point (begin, end) = (%s, %s)" beg end))

; Fast code
; Declare type and use tail recursion
(defun triangle (n)
  (labels ((tri (c n)
                (declare (type fixnum n c))
                (if (zerop n)
                    c
                    (tri (the fixnum (+ n c))
                         (the fixnum (- n 1))))))
    (tri 0 n)))