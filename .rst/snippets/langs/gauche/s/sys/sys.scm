

(sys-getenv "PATH")
(sys-getenv "PAT")  ; #f

; ls
(glob "*")
(glob "../.*")  ; 隠しファイルは明示的に.が必要
(glob "**/*.h")  ;再帰的に.hにマッチ（階層は2とは限らない）

*program-name*  ; (car args) ; (command-line)


;(sys-random)
; (receive (oport name) (sys-mkstemp "/tmp/test"))  ; tmpfile作成
; mkdir -p PATHと同じ
; (make-directory* "/tmp/a/b/c")

(runS "(sys-system \"ls\")")
;; (sys-mkdir "test" 777)  ; dir作成
;; (sys-basename "foo/bar/bar.z")  ; "bar.z"
;; (sys-sleep 1)
;; (sys-select #f #f #f '(1 5))
