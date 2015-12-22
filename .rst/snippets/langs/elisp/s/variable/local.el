; set local variable
; this variable can't be referred in the other buffers
(unless (boundp 'a)
  (set (make-local-variable 'a) 1))

; buffer local な変数を作成
(set (make-local-variable 'name) value)