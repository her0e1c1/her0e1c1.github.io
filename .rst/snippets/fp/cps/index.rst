==============
 Continuation
==============

.. contents::




flatten.scm
===========




test
----



.. code-block:: scm

    
    (add-load-path "." :relative)
    (load "flatten.scm")
    (use gauche.test)
    
    (test* "(flatten/cps X)" '() (flatten/cps '() values))
    (test* "(flatten/cps X)" '(a b c) (flatten/cps '(a b c) values))
    (test* "(flatten/cps X)" '(a b c d e f g h) (flatten/cps '(a (b (c d) e) (f g) h)) values)
    (test* "(flatten/cps X)" '(a b c d e f g h) (flatten/cps '(a (((b) (c d)) ((e) (f) (((g)))) h)) values))
    



::

    test (flatten/cps X), expects () ==> ok
    test (flatten/cps X), expects (a b c) ==> ok
    test (flatten/cps X), expects (a b c d e f g h) ==> ok
    test (flatten/cps X), expects (a b c d e f g h) ==> ok






fib.scm
=======




test
----



.. code-block:: scm

    
    (add-load-path "." :relative)
    (load "fib.scm")
    (use gauche.test)
    
    ; 0 1 2 3 4 5 6 7  8  9  10
    ; 0 1 1 2 3 5 8 13 21 34 55
    (test* "(fib/cps 0)"  0   (fib/cps 0 values))
    (test* "(fib/cps 1)"  1   (fib/cps 1 values))
    (test* "(fib/cps 2)"  1   (fib/cps 2 values))
    (test* "(fib/cps 8)"  21   (fib/cps 8 values))
    (test* "(fib/cps 10)"  55   (fib/cps 10 values))
    



::

    test (fib/cps 0), expects 0 ==> ok
    test (fib/cps 1), expects 1 ==> ok
    test (fib/cps 2), expects 1 ==> ok
    test (fib/cps 8), expects 21 ==> ok
    test (fib/cps 10), expects 55 ==> ok






leaf-count.scm
==============




test
----



.. code-block:: scm

    
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
    



::

    test (leaf-count/cps 0), expects 1 ==> ok
    test (leaf-count/cps 1), expects 2 ==> ok
    test (leaf-count/cps 2), expects 3 ==> ok
    test (leaf-count/cps 3), expects 5 ==> ok
    test (leaf-count/cps 4), expects 7 ==> ok
    test (leaf-count/cps 5), expects 7 ==> ok
    test (leaf-count/cps 5), expects 8 ==> ok






fact.scm
========




test
----



.. code-block:: scm

    
    (add-load-path "." :relative)
    (load "fact.scm")
    (use gauche.test)
    
    (test* "(fact/cps 1)"  1   (fact/cps 1 values))
    (test* "(fact/cps 10)" 120 (fact/cps 5 values))
    



::

    test (fact/cps 1), expects 1 ==> ok
    test (fact/cps 10), expects 120 ==> ok

