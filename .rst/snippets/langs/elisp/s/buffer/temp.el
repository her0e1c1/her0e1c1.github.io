
; make a new buffer and return string in the buffer.
; this temp buffer name is *temp*.
(with-temp-buffer
  (insert "this is a sample text.")
  (insert (buffer-name))
  (buffer-string))