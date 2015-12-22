

; check emacs version
(if (>= emacs-major-version 24)
    (message "version 24 or higher")
  (message "version 23 or lower"))

; Get env values
(getenv "PATH")

;; Note
;; If you want to use env in a bash, don't start emacs in others. ex) mac' dock


; declare-function returns NIL