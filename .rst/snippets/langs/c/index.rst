
==========
C Language
==========


.. toctree::
    :glob:

    ce/*


pre complie
===========


ifdef else endifはソースコードをコンパイルする前の前処理
以下の一文を明示する
#define DEBUG
あるいは、オプションを渡す(#define DEBUGと同じ効果


.. code-block:: c
   

    #include <stdio.h>
    
    int main () {
    #ifdef DEBUG
      printf("DEBUG");
    #else
      printf("NOT DEBUG");
    #endif
    }
    


.. code-block:: sh
   

    $ clang -DDEBUG ifdef.c && ./a.out
    DEBUG

引数を渡さなかった場合はelseが呼ばれる

.. code-block:: sh
   

    $ clang ifdef.c && ./a.out
    NOT DEBUG



NULL
====


.. warning::

    You need to inlcude stdio.h to use NULL.


.. code-block:: c
   

    int main () {
      printf("%p", NULL);
    }
    


.. code-block:: sh
   

    $ clang NULL.c && ./a.out
    NULL.c:2:3: warning: implicitly declaring library function 'printf' with type 'int (const char *, ...)'
      printf("%p", NULL);
      ^
    NULL.c:2:3: note: please include the header <stdio.h> or explicitly provide a declaration for 'printf'
    NULL.c:2:16: error: use of undeclared identifier 'NULL'
      printf("%p", NULL);
                   ^
    1 warning and 1 error generated.
    


.. code-block:: c
   

    #include <stdio.h>
    int main () {
      printf("%p", NULL);
    }
    


.. code-block:: sh
   

    $ clang NULL1.c && ./a.out
    0x0

