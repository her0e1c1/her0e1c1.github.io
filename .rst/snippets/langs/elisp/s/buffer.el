
(defun sample-pop-to-buffer()
  ; you c get a buffer object.
  (setq buff (pop-to-buffer "buffer name"))
  ; so you need this code below if you want to change the current buffer.
  ; or you can use with-current-buffer.
  (set-buffer buff)
  (insert "test text."))

; rename-buffer
; get-buffer
; buffer-file-name (func/var)
; get-buffer-create
; kill-buffer

(switch-to-buffer "*scratch*")
(current-buffer)
(bufferp (current-buffer))
(buffer-size)
(buffer-name)
(erase-buffer)