; awhen
(emacs (--when-let (+ 1 2 3) (* it it)))
(emacs (--when-let nil (* it it)) )
