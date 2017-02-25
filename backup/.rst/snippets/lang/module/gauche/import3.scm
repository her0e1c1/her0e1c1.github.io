; load.scmに定義してある変数xをインポートする
; gosh ./import3.scm
; add-load-pathをしなくても絶対/相対パスで記述できる(ただし実行ディレクトリが基準)

(define x 0)
(print x)
(include "./load.scm")  ; ここから再定義可能
(print x)