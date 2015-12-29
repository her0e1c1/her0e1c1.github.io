
(emacs (type-of 42))
(emacs (type-of 3.14))
(emacs (type-of "foo"))
(emacs (type-of '(1 2)))
(emacs (type-of '[1 2]))
(emacs (type-of 'foo))
(emacs (type-of ?a))

 
(emacs (symbolp 'foo))
(emacs (symbol-name 'foo))
(emacs (symbol-value 'foo))
(emacs (boundp 'foo)  :msg "値セルに値があればt、なければnil")
(emacs (fboundp 'foo) :msg "関数セルに関数があればt、なければnil")
(emacs (symbol-function 'foo))
