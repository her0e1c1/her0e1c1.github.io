(define text1 "1. FIRST
2. SECOND
3. THIRD
")

(define-macro (emacs-text text . body)
  `(emacs (with-temp-buffer (insert ,text) ,@body (string (char-after)))))

(emacs (with-temp-buffer (insert "ho\nge\n") (previous-line) (point)))
(emacs (with-temp-buffer (insert "ho\nge\n") (point)))
(emacs (with-temp-buffer (insert "FIRST LINE") (beginning-of-line) (string (char-after))))

(eval-null `(emacs-text ,text1 (previous-line)))

;; ; 前後の行へ移動
;; (previous-line)
;; (next-line)

;; (forward-to-indentation)
;; (backward-to-indentation)

;; ; 行頭へ移動
;; (move-beginning-of-line 1)
;; ; 次の行
;; (move-beginning-of-line 2)
;; ; 前の行へ移動
;; (move-beginning-of-line 0)
;; ; 前の前の行へ移動
;; (move-beginning-of-line -1)

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
;; (re-search-backward "\n")
;; ; limit is nil???
;; (re-search-backward "^not-matched-string!!!" nil t)  ; nil
;; (re-search-backward "^not-matched-string!!!" nil nil); error!

; skip-chars-backward
