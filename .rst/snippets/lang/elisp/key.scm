;; ; ターミナルにバインドに特殊文字を送る
;; (defun event-apply-control-shift-modifier (ignore-prompt)
;;   "\\Add the Control+Shift modifier to the following event.
;; For example, type \\[event-apply-control-shift-modifier] SPC to enter Control-Shift-SPC."
;;   (vector (event-apply-modifier
;;            (event-apply-modifier (read-event) 'shift 25 "S-")
;;            'control 26 "C-")))

;; (define-key function-key-map (kbd "C-x @ C") 'event-apply-control-shift-modifier)


;; (global-unset-key "\C-s")

;;; Translate a two-byte space into one-byte
;; (global-set-key "　" (lambda () (interactive) (insert " ")))

;; ;;; Warning: not working becaouse not registering this procedure as an interactive function
;; ; (global-set-key "　" (lambda () (insert " ")))

;; ;;; create key EMPTY map
;; (let ((map (make-sparse-keymap)))
;;   (define-key map (kbd "C-c C-k") (insert 1))
;;   )

;; ; Same expressions
;; (define-key global-map (kbd "\C-t") 'a-command)
;; (global-set-key (kbd "\C-t") 'a-command)
