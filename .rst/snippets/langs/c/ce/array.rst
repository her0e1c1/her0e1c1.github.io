
=======
 Array 
=======



enum
====


.. code-block:: sh
   

    $ ce 'enum E{A,B}; enum E e=A; p("%d", e);'
    0


.. code-block:: sh
   

    $ ce 'enum E{A,B}; enum E e=B; p("%d", e);'
    1


.. code-block:: sh
   

    $ ce 'enum E{A=10,B}; enum E e=A; p("%d", e);'
    10


.. code-block:: sh
   

    $ ce 'enum E{A=10,B}; enum E e=B; p("%d", e);'
    11

alias enum

.. code-block:: sh
   

    $ ce 'typedef enum E{A,B}F; F e=A; p("%d", e);'
    0


.. code-block:: sh
   

    $ ce 'typedef enum E{A,B}F; F e=B; p("%d", e);'
    1

create a variable

.. code-block:: sh
   

    $ ce 'enum E{A,B}e; e=A; p("%d", e);'
    0


.. code-block:: sh
   

    $ ce 'enum E{A,B}e; e=B; p("%d", e);'
    1



false
=====


.. code-block:: sh
   

    $ ce 'if(!0)p("false");'
    false


.. code-block:: sh
   

    $ ce 'if(!NULL)p("false");'
    false


.. code-block:: sh
   

    $ ce 'char *s=""; if(!*s)p("false");'
    false


.. code-block:: sh
   

    $ ce 'if("")p("true");'
    true



fflush
======

printf doesn't output until it encounters newline. an error will occur because of referring null pointer

.. code-block:: sh
   

    $ ce 'char*a=NULL, b; p("this is NOT printed."); b=*a;'
    セグメンテーション違反
    


.. code-block:: sh
   

    $ ce 'char*a=NULL, b; p("this is printed."); fflush(stdout); b=*a;'
    this is printed.セグメンテーション違反
    



group_from_gid
==============

if gid (the first arg) exists, return its name

.. code-block:: sh
   

    $ ce 'p("%s", group_from_gid(0, 0));'
    wheel

if gid doesn't exists, return the number. the return type is not int but char*

.. code-block:: sh
   

    $ ce 'p("%s", group_from_gid(123456, 0));'
    123456

Or just return NULL if the second argument is nonzero

.. code-block:: sh
   

    $ ce 'p("%s", group_from_gid(123456, 1));'
    (null)



memset
======

Fill 0

.. code-block:: sh
   

    $ ce 'int a[10][10]; memset(a, 0, sizeof(a)); p("%d", a[0][0]);'
    0

Fill -1

.. code-block:: sh
   

    $ ce 'int a[10][10]; memset(a, -1, sizeof(a)); p("%d", a[0][0]);'
    -1

Don't work because memset fills numbers but 0 or -1 at each byte

.. code-block:: sh
   

    $ ce 'int a[10][10]; memset(a, 1, sizeof(a)); p("%d", a[0][0]);'
    16843009


.. code-block:: sh
   

    $ ce 'int a[10][10]; memset(a, 10, sizeof(a)); p("%d", a[0][0]);'
    168430090


.. code-block:: sh
   

    $ ce 'int i[1]; memset(i, 1, sizeof(int)); printf("%x", i[0]);'
    1010101



realpath
========

Normalize path. I think return value is the same as a buff-stored value.

.. code-block:: sh
   

    $ ce 'char s[PATH_MAX]; p("%s", realpath("/home/../home/././.", s));'
    /usr/home



sizeof
======

with %zu print as unsigned decimal

.. code-block:: sh
   

    $ ce 'p("%zu", sizeof(char));'
    1


.. code-block:: sh
   

    $ ce 'p("%zu", sizeof(short));'
    2


.. code-block:: sh
   

    $ ce 'p("%zu", sizeof(int));'
    4


.. code-block:: sh
   

    $ ce 'p("%zu", sizeof(size_t));'
    8


.. code-block:: sh
   

    $ ce 'p("%zu", sizeof(void*));'
    8


.. code-block:: sh
   

    $ ce 'p("%zu", sizeof(long));'
    8


.. code-block:: sh
   

    $ ce 'p("%zu", sizeof(float));'
    4


.. code-block:: sh
   

    $ ce 'p("%zu", sizeof(double));'
    8


.. code-block:: sh
   

    $ ce 'p("%zu", sizeof(long float));'
    <stdin>:42:21: error: 'long float' is invalid
        p("%zu", sizeof(long float));
                        ^
    1 error generated.
    


.. code-block:: sh
   

    $ ce 'p("%zu", sizeof(long long));'
    8


.. code-block:: sh
   

    $ ce 'p("%zu", sizeof(long double));'
    16


.. code-block:: sh
   

    $ ce 'p("%zu", sizeof(double double));'
    <stdin>:42:28: error: cannot combine with previous 'double' declaration specifier
        p("%zu", sizeof(double double));
                               ^
    1 error generated.
    

sizeof gets all the memory size, not the length of an array

.. code-block:: sh
   

    $ ce 'int b[10]; p("%zu", sizeof(b));'
    40

