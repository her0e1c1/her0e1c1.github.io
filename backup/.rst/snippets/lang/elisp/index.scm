;;; 以下は、使わない方針とする
;;; comint (interactive shell in emacs)
;;; frame (emacs with X window)

;; (encode-coding-string "漢字です" 'euc-jp)
;; (encode-coding-string "漢字です" 'utf-8)
;; (encode-coding-string "漢字です" 'emacs-mule)

(decode-coding-string (encode-coding-string "漢字です" 'utf-8) 'utf-8)
(read-string "PROMPT: " "STR1")

;; (setq w (selected-window))
;; (setq w2 (split-window w 30))
;; (setq w3 (split-window w 70 t))

;; 一部をread-onlyにする::
;; (put-text-property (line-beginning-position) (point) 'read-only t)

;; (inhibit-read-only t)としないと変更できない. ::

;;     (let ((inhibit-read-only t))
;;       (remove-text-properties (line-beginning-position) (line-end-position) '(read-only t)))

;;  (rx "foo")
;;  (\? . zero-or-one)
;;  ;シンボル(変数名)
;;  ;大文字と小文字とアンダーバーを1つ
;;  ;かつ 数値を含めた文字と_を0以上
;;  ;_Abc3
;;  (any letter ?_) (* word ?_)
;;  (any ?' ?\")
;;  (+ space)

;; emacsの提供する正規表現とは違い、エスケープしなくても使える？
;; NO-GROUPがnon-nilの場合は結果にshy groupを加えません。

;;  (rx-to-string (car '((* any))) t)  ; => ".*"
;;  (rx-to-string (car '((* any))))  ; => "\\(?:.*\\)"
 
 ;(goto-char beg)
 ;BODY
 ;一行ずつ実行します。
 (while (< (point) end) (forward-line))

echo "(1 2 3)" | emacs -Q -batch -eval "(print (apply '+ (read standard-input)))"

(format nil "~:D" 1000) ; "1,000"
(format nil "~D" 1000)  ; "1000"
(unintern 'test)

(defmacro test (name)
  `(defun ,(intern (concat "test-" name "-p") )
          ()))