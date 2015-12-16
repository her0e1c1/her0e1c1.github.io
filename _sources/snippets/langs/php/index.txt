=====
 PHP
=====

::

  curl -O psysh.org/psysh && php psysh

::

   php -r 'echo "hello world";'


.. code-block:: sh
   

    $ php -r 'if (1) {echo "true";}'
    true


.. code-block:: sh
   

    $ php -r '$dict = array(5 => 1, 12 => 2); echo "$dict[5]";'
    1


.. code-block:: sh
   

    $ php -r '$arr = array(10, 20, 30, 40, 50); echo "$arr[0]";'
    10


.. code-block:: sh
   

    $ php -r 'class A {public $v = 'val';} $a=new A(); echo "$a->v";'
    val

