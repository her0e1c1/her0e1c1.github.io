========
 Gauche 
========



.. toctree::

   gauche2c/index



apply
=====


.. code-block:: sh
   

    $ gosh -e "(print (begin (apply + '(1 3 3))))" -Eexit
    7
    


.. code-block:: sh
   

    $ gosh -e "(print (begin (apply + \`,(list 1 (+ 1 2) 3))))" -Eexit
    7
    


.. code-block:: sh
   

    $ gosh -e "(print (begin (apply + '(1 (+ 1 2) 3))))" -Eexit
    gosh: "error": operation + is not defined between 1 and (+ 1 2)
    


.. code-block:: sh
   

    $ gosh -e "(print (begin (apply + \`,(1 (+ 1 2) 3))))" -Eexit
    gosh: "error": invalid application: (1 3 3)
    


.. warning::

    特殊形式andにはapplyが使えない


.. code-block:: sh
   

    $ gosh -e "(print (begin (apply and '(#t #f))))" -Eexit
    gosh: "error": invalid application: (#<syntax and> #t #f)
    



recieve
=======


.. code-block:: sh
   

    $ gosh -e "(print (begin (receive (a b) (values 1 2) (+ a b))))" -Eexit
    3
    



define-syntax
=============


.. code-block:: sh
   

    $ gosh -e "(print (begin (define-syntax S (syntax-rules () ((_ a) (+ a 1)) ((_ a b) (+ a b)))) (S 2)))" -Eexit
    3
    


.. code-block:: sh
   

    $ gosh -e "(print (begin (define-syntax S (syntax-rules () ((_ a) (+ a 1)) ((_ a b) (+ a b)))) (S 10 20)))" -Eexit
    30
    

(literal ...)
HOGE becomes a keyword

.. code-block:: sh
   

    $ gosh -e "(print (begin (define-syntax S (syntax-rules (HOGE) ((_ a HOGE) (+ a 1)))) (S 10 HOGE)))" -Eexit
    11
    


.. code-block:: sh
   

    $ gosh -e "(print (begin (define-syntax S (syntax-rules (HOGE) ((_ a HOGE) (+ a 1)))) (S 10 H)))" -Eexit
    gosh: "error": Compile Error: malformed S: (S 10 H)
    "(input string port)":1:(print (begin (define-syntax S (synt ...
    
    

