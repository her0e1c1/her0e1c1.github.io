; *load-path* の設定をコマンド入力時に行う
; gosh -I . import1.scm
; gosh -I module ./module/import1.scm
; gosh import1.scm はインポートエラーとなる
 
(use module)

(define (main argv)
  (print x)
  0)