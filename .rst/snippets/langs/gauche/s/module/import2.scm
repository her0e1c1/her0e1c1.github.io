; load.scmに定義してある変数xをインポートする
; gosh import2.scm

(add-load-path "." :relative)  ; このファイルのディレクトリが基準
(load "load.scm")
(print x)