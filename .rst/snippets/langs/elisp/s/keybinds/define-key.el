;tag: warn

;;; Translate a two-byte space into one-byte
(global-set-key "　" (lambda () (interactive) (insert " ")))

;;; Warning: not working becaouse not registering this procedure as an interactive function
; (global-set-key "　" (lambda () (insert " ")))