

        (int-to-string 11)
         (string-match "str" "string")

  
(substring "abcdef" 0 2) ; "ab" 

 
;; (encode-coding-string "漢字です" 'sjis)
;; (encode-coding-string "漢字です" 'euc-jp)
;; (encode-coding-string "漢字です" 'utf-8)
;; (encode-coding-string "漢字です" 'emacs-mule)
 

(decode-coding-string (encode-coding-string "漢字です" 'utf-8) 'utf-8)

     
(substring-no-properties "'this is a test'" 1 -1)

       
(read-string "PROMPT: " "STR1")

        ;; (setq w (selected-window))
        ;; (setq w2 (split-window w 30))
        ;; (setq w3 (split-window w 70 t))

;; 一部をread-onlyにする::

;;     (put-text-property (line-beginning-position) (point) 'read-only t)

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
 


  (prefix-numeric-value 10)  ; 10
  (prefix-numeric-value -5)  ; 5
  (prefix-numeric-value 10.0)  ; 1
  (prefix-numeric-value -5.0)  ; -1
  (prefix-numeric-value "10")  ;1
  (prefix-numeric-value "asdf")  ;1
  (prefix-numeric-value '(10 20 30))  ; 10

 (type-of 42)
 (type-of 3.14)
 (type-of "foo")
 (type-of '(1 2))
 (type-of '[1 2])
 (type-of 'foo)
 (type-of ?a)  ; Cの'a'相当。内部的には数値


 (symbolp 'foo)    ; シンボルか否かの判定。tが真。nilが偽。(後述)
 (symbol-name 'foo)
 (symbol-value 'foo)
 (boundp 'foo)   ; 値セルに値があればt、なければnil
 (fboundp 'foo)  ; 関数セルに関数があればt、なければnil
 (symbol-function 'foo)

 ;(goto-char beg)
 (while (< (point) end)
    ;BODY
    ;一行ずつ実行します。
    (forward-line))
