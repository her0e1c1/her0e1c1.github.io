(load-from-current-dirctory "include-gauche.scm")

(runs (path-extension "/foo/bar.c.a"))

;; ; 正規化あった
;; ; (sys-normalize-pathname "~//a/./d/b" :expand #t :absolute #t :canonicalize #t)
;; ; "/home/me/a/d/b"
;; ; (file-is-directory? ".")  ; #t

