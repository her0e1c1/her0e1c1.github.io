
========
 String
========



strcat
======

Append strings


.. code-block:: sh
   

    $ ce 'char s[]="abcde", *t="hijk" ; strcat(s, t); p("%s", s);'
    abcdehijk



.. code-block:: sh
   

    $ ce 'char s[]="abcde", t[]="hijk"; strcat(s, t); p("%s", s);'
    abcdehijk

error! if pointer is used, it can't be modified. it is static allocated.


.. code-block:: sh
   

    $ ce 'char *s="abcde", *t="hijk" ; strcat(s, t); p("%s", s);'
    



.. code-block:: sh
   

    $ ce 'char *s="abcde", t[]="hijk"; strcat(s, t); p("%s", s);'
    



.. code-block:: sh
   

    $ ce 'char s[]="", t[]="abcde"; strcat(s, t); p("%s", s);'
    abcde



strstr
======

if searching an empty string, it is always true.


.. code-block:: sh
   

    $ ce 'p("(%s)", strstr("", ""));'
    ()



.. code-block:: sh
   

    $ ce 'p("%s", strstr("abcde", ""));'
    abcde



.. code-block:: sh
   

    $ ce 'p("%s", strstr("abcde", "ABC"));'
    (null)



sprintf
=======

Number to string


.. code-block:: sh
   

    $ ce 'char b[32]; sprintf(b, "%d", 12345); p("%s", b);'
    12345

In case of static declaration of string, it can't be modified.


.. code-block:: sh
   

    $ ce 'char *c ="Memory allocated static  string"; c[1] = 'E'; p("NOT REACHED => %s", c);'
    



.. code-block:: sh
   

    $ ce 'char c[]="Memory allocated dynamic string"; c[1] = 'E'; p("REACHED => %s", c);'
    REACHED => MEmory allocated dynamic string

Declare


.. code-block:: sh
   

    $ ce 'char a[] = "abc";'
    



.. code-block:: sh
   

    $ ce 'char *a  = "abc";'
    



.. code-block:: sh
   

    $ ce 'char a[] = {'a', 'b', 'c'};'
    

Error


.. code-block:: sh
   

    $ ce 'char *a  = {'a', 'b', 'c'};'
    <stdin>:38:17: warning: incompatible integer to pointer conversion initializing 'char *' with an expression of type 'int' [-Wint-conversion]
        char *a  = {'a', 'b', 'c'};
                    ^~~
    <stdin>:38:22: warning: excess elements in scalar initializer
        char *a  = {'a', 'b', 'c'};
                         ^~~
    2 warnings generated.
    

false


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
    <stdin>:38:21: error: 'long float' is invalid
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
    <stdin>:38:28: error: cannot combine with previous 'double' declaration specifier
        p("%zu", sizeof(double double));
                               ^
    1 error generated.
    

sizeof gets all the memory size, not the length of an array


.. code-block:: sh
   

    $ ce 'int b[10]; p("%zu", sizeof(b));'
    40



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

