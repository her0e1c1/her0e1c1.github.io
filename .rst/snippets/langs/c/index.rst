
==========
C Language
==========


.. toctree::
    :glob:

    ce/*


ifdef
=====


.. code-block:: c
   

    #include <stdio.h>
    // #define DEBUG
    int main () {
    #ifdef DEBUG
      printf("DEBUG!");
    #else
      printf("NOT DEBUG!");
    #endif
    }
    

ifdef else endifはソースコードをコンパイルする前の前処理.
オプションを渡すことでdefineされる

.. code-block:: sh
   

    $ clang -DDEBUG ifdef.c && ./a.out
    DEBUG!

引数を渡さなかった場合はelseが呼ばれる

.. code-block:: sh
   

    $ clang ifdef.c && ./a.out
    NOT DEBUG!


.. code-block:: c
   

    #include <stdio.h>
    #define DEBUG
    int main () {
    #ifdef DEBUG
      printf("DEBUG!");
    #else
      printf("NOT DEBUG!");
    #endif
    }
    

``#define DEBUG``を明示する (-DDEBUGと同じ効果)

.. code-block:: sh
   

    $ clang ifdef.c && ./a.out
    DEBUG!



NULL
====


.. warning::

    You need to inlcude stdio.h to use NULL.


.. code-block:: c
   

    // NULL.c
    int main () {
      printf("%p", NULL);
    }


::

    $ clang NULL.c && ./a.out
    <stdin>:2:3: warning: implicitly declaring library function 'printf' with type 'int (const char *, ...)'
      printf("%p", NULL);
      ^
    <stdin>:2:3: note: please include the header <stdio.h> or explicitly provide a declaration for 'printf'
    <stdin>:2:16: error: use of undeclared identifier 'NULL'
      printf("%p", NULL);
                   ^
    1 warning and 1 error generated.
    


.. code-block:: c
   

    // NULL2.c
    #include <stdio.h>
    int main () {
      printf("%p", NULL);
    }


::

    $ clang NULL2.c && ./a.out
    0x0



declare pointers
================


.. warning::

    pointerを２つ同時に宣言するときはアスターは２ついる


.. code-block:: c
   

    // pointer.c
    #include <stdio.h>
    int main (){
      int a = 1;
      int *p, *q;
      q = &a;
      printf("%d", *q);
    }


::

    $ clang pointer.c && ./a.out
    1


.. warning::

    type of q is int


.. code-block:: c
   

    // pointer2.c
    #include <stdio.h>
    int main (){
      int a = 1;
      int *p, q;
      q = &a;
      printf("%d", *q);
    }


::

    $ clang pointer2.c && ./a.out
    <stdin>:5:5: warning: incompatible pointer to integer conversion assigning to 'int' from 'int *'; remove & [-Wint-conversion]
      q = &a;
        ^ ~~
    <stdin>:6:16: error: indirection requires pointer operand ('int' invalid)
      printf("%d", *q);
                   ^~
    1 warning and 1 error generated.
    

なお、
``int *p, *q;`` と複数宣言する場合があるので
``int* a;`` よりも
``int *a;`` と宣言したほうが良い

