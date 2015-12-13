==============
 Continuation
==============

.. contents::




flatten.scm
===========



.. code-block:: scm

    
    (define (flatten/cps tree k)
      (cond ((null? tree) (k '()))
            ((pair? tree)
             (flatten/cps (car tree)
                          (lambda (r1)
                            (flatten/cps
                             (cdr tree)
                             (lambda (r2) (k (append r1 r2)))))))
            (else (k (list tree)))))
    




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



.. code-block:: scm

    
    (define (fib/cps n k)
      (cond ((= n 0) (k 0))
            ((= n 1) (k 1))
            (else (fib/cps (- n 1) (lambda (r1)
                                     (fib/cps (- n 2) (lambda (r2)
                                                        (k (+ r1 r2)))))))))
    




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



.. code-block:: scm

    
    (define (leaf-count/cps tree k)
      (if (pair? tree)
          (leaf-count/cps (car tree) (lambda (n)
                            (leaf-count/cps (cdr tree) (lambda (m) (k (+ n m))))))
          (k 1)))
    




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



.. code-block:: scm

    
    ; m is the result of "(fact (- n 1))"
    ; In "(count XXX)", XXX is the return value the func returns
    (define (fact/cps n cont)
      (if (= n 1)
          (cont 1)
          (fact/cps (- n 1) (lambda (m) (cont (* n m))))))
    




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

