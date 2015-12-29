
; char
(emacs (with-temp-buffer (insert "A") (string (char-before))) :msg "insertするとpointも移動する")
(emacs (with-temp-buffer (insert "A") (string (char-after))) :warn "End Of Stringなのでnil")
(emacs (with-temp-buffer (insert "A") (beginning-of-buffer) (string (char-after))))

; begin/end of buffer
(emacs (with-temp-buffer (insert "A") (beginning-of-buffer) (bobp)))
(emacs (with-temp-buffer (insert "A") (beginning-of-buffer) (eobp)))
(emacs (with-temp-buffer (insert "A") (end-of-buffer) (bobp)))
(emacs (with-temp-buffer (insert "A") (end-of-buffer) (eobp)))

; point
(emacs (with-temp-buffer (insert "ABC") (point-min)) :msg "常に1?")
(emacs (with-temp-buffer (insert "ABC") (point-max)) :warn "Not 3")
(emacs (with-temp-buffer (insert "ABC") (<= (point-min) (point) (point-max))))

; line
(emacs (with-temp-buffer (insert "A") (beginning-of-line) (bolp)))
(emacs (with-temp-buffer (insert "A") (beginning-of-line) (eolp)))
(emacs (with-temp-buffer (insert "A") (end-of-line) (bolp)))
(emacs (with-temp-buffer (insert "A") (end-of-line) (eolp)))



; 現在のカーソルが位置する行の位置
;; (point-at-bol)
;; (point-at-eol)

;; ; lineとpointは区別
;; ; return current line number
;; (line-number-at-pos)  ; == (line-number-at-pos (point))

;; ;;; get point
;; (line-beginning-position)  ;この行の先頭のpoint
;; (line-end-position)
;; (current-column)
;; (current-indentation)


;; ; Save current buffer, current point
;; (save-excursion
;;   ; save current narrowing
;;   (save-restriction
;;     (widen)
;;     ; code
;;     ))
