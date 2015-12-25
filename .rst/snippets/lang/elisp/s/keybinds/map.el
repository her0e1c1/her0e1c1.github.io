;;; create key EMPTY map
(let ((map (make-sparse-keymap)))
  (define-key map (kbd "C-c C-k") (insert 1))
  )