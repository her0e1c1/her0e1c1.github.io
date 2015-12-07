
(add-load-path "." :relative)
(load "fact.scm")
(use gauche.test)

(test* "(fact/cps 1)"  1   (fact/cps 1 values))
(test* "(fact/cps 10)" 120 (fact/cps 5 values))
