
(c "char s[PATH_MAX]; p(\"%s\", realpath(\"/home/../home/././.\", s));"
   :msg "Normalize path. I think return value is the same as a buff-stored value.")


(gosh (sys-normalize-pathname "~//a/./d/b" :expand #t :absolute #t :canonicalize #t))
