
(comint-send-string (get-buffer-process "*buffer*") nil '())
(apply 'make-comint <buffer> <program> nil args)
(comint-kill-subjob)
comint-last-prompt-overlay

(setq buffer (make-comint-in-buffer "PROC_NAME" "BUFFER_NAME" "ls -l"))
