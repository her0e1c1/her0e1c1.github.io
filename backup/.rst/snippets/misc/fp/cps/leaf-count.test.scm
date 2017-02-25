
(add-load-path "." :relative)
(load "leaf-count.scm")
(use gauche.test)

(test* "(leaf-count/cps 0)" 1 (leaf-count/cps '() values))
(test* "(leaf-count/cps 1)" 2 (leaf-count/cps '(a . b) values))
(test* "(leaf-count/cps 2)" 3 (leaf-count/cps '(a b) values))
(test* "(leaf-count/cps 3)" 5 (leaf-count/cps '((a . b) (c . d) . e) values))
(test* "(leaf-count/cps 4)" (+ 3 3 1) (leaf-count/cps '((a b) (c d) . e) values))
(test* "(leaf-count/cps 5)" (+ 2 3 2) (leaf-count/cps '((a . b) (c d) e) values))
(test* "(leaf-count/cps 5)" (+ 3 3 2) (leaf-count/cps '((a b) (c d) e) values))
