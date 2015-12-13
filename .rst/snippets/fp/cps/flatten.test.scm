
(add-load-path "." :relative)
(load "flatten.scm")
(use gauche.test)

(test* "(flatten/cps X)" '() (flatten/cps '() values))
(test* "(flatten/cps X)" '(a b c) (flatten/cps '(a b c) values))
(test* "(flatten/cps X)" '(a b c d e f g h) (flatten/cps '(a (b (c d) e) (f g) h)) values)
(test* "(flatten/cps X)" '(a b c d e f g h) (flatten/cps '(a (((b) (c d)) ((e) (f) (((g)))) h)) values))
