;;;
; helm
; :sources
; :input
; :prompt
; :preselect
; :buffer
; :candidate-number-limit

;;; sources
; (name . "Name")
; (init . '(lambda () ))
; (helm-init-candidates-in-buffer)
; (keymap. map)
; (header-line . "header")
; (action . (lambda () ))

(helm 
 :sources '((name . "test")
            (candidates . ("aaa" "bbb" "ccc" "defalut"))
            (action . (lambda (c) (print c))))
 :input "defalut"
 )

(helm 
 :sources `((name . "test")
            (candidates-in-buffer)
            (init . (lambda () (helm-init-candidates-in-buffer 'global (shell-command-to-string "find ~/work"))))
            (action . (lambda (c) ((point)rint c))))
)