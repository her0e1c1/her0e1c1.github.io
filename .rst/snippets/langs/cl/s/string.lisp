
; ~A format string
; ~% break line
(print (format t "~A~%" "hello"))

(setq s "abcde")
(substring s 0 5)  ; "abcde"
(substring "abcde" 1)  ; "bcde"
(substring "abcde" 1 5)  ; "bcde"
;(substring "abcde" 0 6)  ; error
;(substring "abcde" -1)  ; error

(setq s2 '("ab" "cd" "ef"))
(apply 'string-concat s2)  ; "abcdef"
(string-concat "ab" "cd" "ef")  ; "abcdef"

(defun string-join(ls delim)
  (reduce (lambda (x y) (string-concat x delim y)) ls))
(string-join s2 ", ")  ; "ab, cd, ef"