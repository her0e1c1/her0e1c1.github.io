

(with-temp-buffer
  (insert (repeat 3 "" )
  (narrow-to-region 1 10)
  (buffer-narrowed-p))