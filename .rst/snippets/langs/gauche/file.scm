(load-from-current-dirctory "include-gauche.scm")

(runs (path-extension "/path/to/text.txt"))
(p "parse only one dot")
(runs (path-extension "/foo/bar.c.a"))

(ps "normalize")
(runs (sys-normalize-pathname "~//a/./d/b" :expand #t :absolute #t :canonicalize #t))

(ps "is?")
(runs (file-is-directory? "."))

