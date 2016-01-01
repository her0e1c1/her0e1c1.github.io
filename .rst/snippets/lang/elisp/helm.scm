;; (helm
;;  :sources '((name . "test")
;;             ;(candidates-process . call1)
;;             ;(candidates . (1 2 3))
;;             (candidates-in-buffer)
;;             (init . (lambda ()
;;                       (helm-init-candidates-in-buffer b1 (start-process-shell-command           ;(requires-pattern . 3)
;;             ;(type . file)  ; define actions
;;             ;(candidates . mfilter)
;;             (delayed)
;;             ;(keymap . ,helm-generic-files-map)
;;             ;(candidate-number-limit . 3)
;;             ;(multiline)
;;             ;(mode-line . helm-generic-file-mode-line-string)
;;             ;(history . ,'helm-file-name-history)
;;             (helm-message . "file filter")
;;             ;(requires-pattern . 3)  ; 最低入力文字数
;;             )
;;  :buffer b1
;;  )

;; (defun call ()
;;   (with-current-buffer b1
;;     (start-process-shell-command "name" (current-buffer) "find ~/work")))

;; (defun call1()
;;     (prog1 
;;         (start-process-shell-command "test1" b1 "find ~/Desktop")
;;       (set-process-sentinel
;;        (get-process "test1")
;;        '(lambda (process event)
;;           (setq flag t))))
;;     ))

;; (defun call1 ()
;; (prog1
;;   ;; (with-current-buffer b1
;;   ;; (erase-buffer))helm-pattern
;;   (start-process-shell-command "test1" b1 (cmd helm-pattern))
;;   (setq c (1+ c))
;;   (set-process-sentinel
;;    (get-process "test1")
;;    '(lambda (process event)
;;        (unless (string= event "finished\n")
;;          (helm-log "Error: Filelist" ))))
;;   ;     (replace-regexp-in-string "\n" "" event)))))
;;   ;; (set-process-sentinel 
;;   ;;  (get-process "test1")
;;   ;;  #'(lambda (process event) ))
;; ))
;; c
;; (defun helm-filelist-init-async ()
;;   (let ((process-connection-type))
;;     (prog1
;;         (start-process-shell-command
;;          "filelist-grep-process" helm-buffer
;;          (helm-filelist-make-cmd-line helm-pattern
;;                                       helm-filelist-file-name
;;                                       helm-filelist-candidate-number-limit))
;;       (set-process-sentinel
;;        (get-process "filelist-grep-process")
;;        #'(lambda (process event)
;;            (unless (string= event "finished\n")
;;              (helm-log "Error: Filelist %s"
;;                        (replace-regexp-in-string "\n" "" event))))))))



;; ; Setting like this
;; (defcustom helm-swoop-split-direction 'split-window-vertically
;;  "Split direction"
;;  :type '(choice (const :tag "vertically"   split-window-vertically)
;;                 (const :tag "horizontally" split-window-horizontally))
;;  :group 'helm-swoop)

;; ; M-x customize-variable RET helm-swoop-split-direction
;; ; [Value-Menu] > select what you want
;; ; Apply and save

;; ;; automatically written in ~/.emacs
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(helm-swoop-split-direction (quote split-window-horizontally)))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  )

;; ;;;
;; ; helm
;; ; :sources
;; ; :input
;; ; :prompt
;; ; :preselect
;; ; :buffer
;; ; :candidate-number-limit

;; ;;; sources
;; ; (name . "Name")
;; ; (init . '(lambda () ))
;; ; (helm-init-candidates-in-buffer)
;; ; (keymap. map)
;; ; (header-line . "header")
;; ; (action . (lambda () ))

;; (helm 
;;  :sources '((name . "test")
;;             (candidates . ("aaa" "bbb" "ccc" "defalut"))
;;             (action . (lambda (c) (print c))))
;;  :input "defalut"
;;  )

;; (helm 
;;  :sources `((name . "test")
;;             (candidates-in-buffer)
;;             (init . (lambda () (helm-init-candidates-in-buffer 'global (shell-command-to-string "find ~/work"))))
;;             (action . (lambda (c) ((point)rint c))))
;; )
