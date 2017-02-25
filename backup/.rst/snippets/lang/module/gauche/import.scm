; module.scmに定義してある変数xをインポートする
; gosh import.scm

(add-load-path "." :relative)
(use module)

(define a
  (let ((x 10))
    (+ (with-module module x) x)))

(define (main argv)
  (print x)
  (print (with-module module x))  ; 指定したモジュールの値取得
  (print a)  ; let内では上書きされるみたい
  0)  ; or exit code 70