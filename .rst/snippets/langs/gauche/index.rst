========
 Gauche 
========



.. toctree::

   gauche2c/index



apply
=====


.. code-block:: sh
   

    $ ce '(apply + '(1 3 3))'
    Syntax error: "(" unexpected
    


.. code-block:: sh
   

    $ ce '(apply + \`,(list 1 (+ 1 2) 3))'
    <stdin>:40:6: error: use of undeclared identifier 'apply'
        (apply + \`,(list 1 (+ 1 2) 3))
         ^
    <stdin>:40:14: error: expected expression
        (apply + \`,(list 1 (+ 1 2) 3))
                 ^
    2 errors generated.
    


.. code-block:: sh
   

    $ ce '(apply + '(1 (+ 1 2) 3))'
    Syntax error: "(" unexpected
    


.. code-block:: sh
   

    $ ce '(apply + \`,(1 (+ 1 2) 3))'
    <stdin>:40:6: error: use of undeclared identifier 'apply'
        (apply + \`,(1 (+ 1 2) 3))
         ^
    <stdin>:40:14: error: expected expression
        (apply + \`,(1 (+ 1 2) 3))
                 ^
    2 errors generated.
    


.. warning::

    特殊形式andにはapplyが使えない


.. code-block:: sh
   

    $ ce '(apply and '(#t #f))'
    Syntax error: "(" unexpected
    



recieve
=======


.. code-block:: sh
   

    $ ce '(receive (a b) (values 1 2) (+ a b))'
    <stdin>:40:6: warning: implicit declaration of function 'receive' is invalid in C99 [-Wimplicit-function-declaration]
        (receive (a b) (values 1 2) (+ a b))
         ^
    <stdin>:40:15: error: use of undeclared identifier 'a'
        (receive (a b) (values 1 2) (+ a b))
                  ^
    <stdin>:40:21: error: use of undeclared identifier 'values'
        (receive (a b) (values 1 2) (+ a b))
                        ^
    <stdin>:40:36: error: use of undeclared identifier 'a'
        (receive (a b) (values 1 2) (+ a b))
                                       ^
    1 warning and 3 errors generated.
    



define-syntax
=============


.. code-block:: sh
   

    $ ce '(define-syntax S (syntax-rules () ((_ a) (+ a 1)) ((_ a b) (+ a b)))) (S 2)'
    <stdin>:40:6: error: use of undeclared identifier 'define'
        (define-syntax S (syntax-rules () ((_ a) (+ a 1)) ((_ a b) (+ a b)))) (S 2)
         ^
    <stdin>:40:13: error: use of undeclared identifier 'syntax'
        (define-syntax S (syntax-rules () ((_ a) (+ a 1)) ((_ a b) (+ a b)))) (S 2)
                ^
    <stdin>:40:76: error: use of undeclared identifier 'S'
        (define-syntax S (syntax-rules () ((_ a) (+ a 1)) ((_ a b) (+ a b)))) (S 2)
                                                                               ^
    3 errors generated.
    


.. code-block:: sh
   

    $ ce '(define-syntax S (syntax-rules () ((_ a) (+ a 1)) ((_ a b) (+ a b)))) (S 10 20)'
    <stdin>:40:6: error: use of undeclared identifier 'define'
        (define-syntax S (syntax-rules () ((_ a) (+ a 1)) ((_ a b) (+ a b)))) (S 10 20)
         ^
    <stdin>:40:13: error: use of undeclared identifier 'syntax'
        (define-syntax S (syntax-rules () ((_ a) (+ a 1)) ((_ a b) (+ a b)))) (S 10 20)
                ^
    <stdin>:40:76: error: use of undeclared identifier 'S'
        (define-syntax S (syntax-rules () ((_ a) (+ a 1)) ((_ a b) (+ a b)))) (S 10 20)
                                                                               ^
    3 errors generated.
    

(literal ...)
HOGE becomes a keyword

.. code-block:: sh
   

    $ ce '(define-syntax S (syntax-rules (HOGE) ((_ a HOGE) (+ a 1)))) (S 10 HOGE)'
    <stdin>:40:6: error: use of undeclared identifier 'define'
        (define-syntax S (syntax-rules (HOGE) ((_ a HOGE) (+ a 1)))) (S 10 HOGE)
         ^
    <stdin>:40:13: error: use of undeclared identifier 'syntax'
        (define-syntax S (syntax-rules (HOGE) ((_ a HOGE) (+ a 1)))) (S 10 HOGE)
                ^
    <stdin>:40:67: error: use of undeclared identifier 'S'
        (define-syntax S (syntax-rules (HOGE) ((_ a HOGE) (+ a 1)))) (S 10 HOGE)
                                                                      ^
    3 errors generated.
    


.. code-block:: sh
   

    $ ce '(define-syntax S (syntax-rules (HOGE) ((_ a HOGE) (+ a 1)))) (S 10 H)'
    <stdin>:40:6: error: use of undeclared identifier 'define'
        (define-syntax S (syntax-rules (HOGE) ((_ a HOGE) (+ a 1)))) (S 10 H)
         ^
    <stdin>:40:13: error: use of undeclared identifier 'syntax'
        (define-syntax S (syntax-rules (HOGE) ((_ a HOGE) (+ a 1)))) (S 10 H)
                ^
    <stdin>:40:67: error: use of undeclared identifier 'S'
        (define-syntax S (syntax-rules (HOGE) ((_ a HOGE) (+ a 1)))) (S 10 H)
                                                                      ^
    3 errors generated.
    

