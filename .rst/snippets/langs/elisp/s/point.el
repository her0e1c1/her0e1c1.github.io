;;; is???
; forward-char(backward-char)
; forward-word(backward-word) カーソルを一つ前に動かす
; forward-sexp(backward-sexp)
; forward-list(backward-list)
; forward-sentence(backward-sentence)
; forward-line(backward-lineはありません。)
; goto-char
; goto-line
; move-to-column,

;;; cursour  moves 
; if the third arg is t and no string matches, no error occurs.
(re-search-backward "\n")
; limit is nil???
(re-search-backward "^not-matched-string!!!" nil t)  ; nil
(re-search-backward "^not-matched-string!!!" nil nil); error!

; scroll-up(scroll-down)
; skip-chars-backward

;;; get point
(line-beginning-position)  ;この行の先頭のpoint
(line-end-position)
(current-column)
(current-indentation)