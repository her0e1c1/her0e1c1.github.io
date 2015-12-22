(helm
 :sources '((name . "test")
            ;(candidates-process . call1)
            ;(candidates . (1 2 3))
            (candidates-in-buffer)
            (init . (lambda ()
                      (helm-init-candidates-in-buffer b1 (start-process-shell-command "tst" b1 "find ~/Desktop"))))
            ;(volatile)
            ;(requires-pattern . 3)
            ;(type . file)  ; define actions
            ;(candidates . mfilter)
            (delayed)
            ;(keymap . ,helm-generic-files-map)
            ;(candidate-number-limit . 3)
            ;(multiline)
            ;(mode-line . helm-generic-file-mode-line-string)
            ;(history . ,'helm-file-name-history)
            (helm-message . "file filter")
            ;(requires-pattern . 3)  ; 最低入力文字数
            )
 :buffer b1
 )

(defun mfilter(c)
  nil)

(defun call ()
  (with-current-buffer b1
    (start-process-shell-command "name" (current-buffer) "find ~/work")))

(with-current-buffer b1
  (buffer-string))

(helm-other-buffer (helm-source-filelist) "*helm filelist*")

(defun _cmd (patterns result &optional limit)
  (if (s-blank? result)
      (with-temp-buffer 
        (insert "find ~/Desktop")
        (buffer-string))
    (if (not (s-blank? patterns))
        (insert (s-join  " " (--> (s-split " " patterns) (-remove 's-blank? it)(--map (format "|grep %s" it) it))))))

(defun cmd (patterns &optional limit)
  (with-temp-buffer 
    (insert "find ~/Desktop")
    (if (not (s-blank? patterns))
        (insert (s-join  " " (--> (s-split " " patterns) (-remove 's-blank? it)(--map (format "|grep %s" it) it)))))
    (buffer-string)))

(setq b1 (get-buffer-create "*temp6*"))
(setq c 1)
(setq flag nil)
(defun call1()
  (if flag
      (progn
        (->>
          (s-split "\n" (with-current-buffer b1 (buffer-string)))
          (--filter (s-contains? "re" it))
          (s-join "\n")
          (setq $str))
        (with-current-buffer b1
          (erase-buffer)
          (insert $str)))
    (prog1 
        (start-process-shell-command "test1" b1 "find ~/Desktop")
      (set-process-sentinel
       (get-process "test1")
       '(lambda (process event)
          (setq flag t))))
    ))

(get-buffer-process b1)
(defun call1 ()
(prog1
  ;; (with-current-buffer b1
  ;; (erase-buffer))helm-pattern
  (start-process-shell-command "test1" b1 (cmd helm-pattern))
  (setq c (1+ c))
  (set-process-sentinel
   (get-process "test1")
   '(lambda (process event)
       (unless (string= event "finished\n")
         (helm-log "Error: Filelist" ))))
  ;     (replace-regexp-in-string "\n" "" event)))))
  ;; (set-process-sentinel 
  ;;  (get-process "test1")
  ;;  #'(lambda (process event) ))
))
c
(defun helm-filelist-init-async ()
  (let ((process-connection-type))
    (prog1
        (start-process-shell-command
         "filelist-grep-process" helm-buffer
         (helm-filelist-make-cmd-line helm-pattern
                                      helm-filelist-file-name
                                      helm-filelist-candidate-number-limit))
      (set-process-sentinel
       (get-process "filelist-grep-process")
       #'(lambda (process event)
           (unless (string= event "finished\n")
             (helm-log "Error: Filelist %s"
                       (replace-regexp-in-string "\n" "" event))))))))

 ;(async-shell-command "ls" (current-buffer))

  (buffer-string)
aREADME.md
jj(setq a (shell-command-to-string "find ~/work &"))
ai
Process name finished