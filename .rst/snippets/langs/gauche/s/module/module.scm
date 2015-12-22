; gaucheの場合、モジュール名.scmとファイルを作成し
; *load-path* 以下に配置する必要がある

(define-module module
  (export x))

(select-module module)

(define x 1)