
========
 String
========

.. contents::



Declare
=======


.. code-block:: sh
   

    $ ce 'char a[] = "abc";'
    


.. code-block:: sh
   

    $ ce 'char *a  = "abc";'
    


.. code-block:: sh
   

    $ ce 'char a[] = {'a', 'b', 'c'};'
    <stdin>:42:20: error: use of undeclared identifier 'b'
        char a[] = {a, b, c};
                       ^
    <stdin>:42:23: error: use of undeclared identifier 'c'
        char a[] = {a, b, c};
                          ^
    2 errors generated.
    


.. warning::

    Error


.. code-block:: sh
   

    $ ce 'char *a  = {'a', 'b', 'c'};'
    <stdin>:42:20: error: use of undeclared identifier 'b'
        char *a  = {a, b, c};
                       ^
    <stdin>:42:23: error: use of undeclared identifier 'c'
        char *a  = {a, b, c};
                          ^
    2 errors generated.
    


.. warning::

    In case of static declaration of string, it can't be modified.


.. code-block:: sh
   

    $ ce 'char *c ="Memory allocated static  string"; c[1] = 'E'; p("NOT REACHED => %s", c);'
    <stdin>:42:56: error: use of undeclared identifier 'E'
        char *c ="Memory allocated static  string"; c[1] = E; p("NOT REACHED => %s", c);
                                                           ^
    1 error generated.
    


.. code-block:: sh
   

    $ ce 'char c[]="Memory allocated dynamic string"; c[1] = 'E'; p("REACHED => %s", c);'
    <stdin>:42:56: error: use of undeclared identifier 'E'
        char c[]="Memory allocated dynamic string"; c[1] = E; p("REACHED => %s", c);
                                                           ^
    1 error generated.
    



sprintf
=======

Number to string

.. code-block:: sh
   

    $ ce 'char b[32]; sprintf(b, "%d", 12345); p("%s", b);'
    12345



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
    セグメンテーション違反
    


.. code-block:: sh
   

    $ ce 'char *s="abcde", t[]="hijk"; strcat(s, t); p("%s", s);'
    セグメンテーション違反
    


.. code-block:: sh
   

    $ ce 'char s[]="", t[]="abcde"; strcat(s, t); p("%s", s);'
    abcde



strcmp
======


.. code-block:: sh
   

    $ ce 'if(strcmp("abc", "abc") == 0) p("true");'
    true


.. code-block:: sh
   

    $ ce 'p("%d", strcmp("a", "z"));'
    -25


.. code-block:: sh
   

    $ ce 'p("%d", strcmp("z", "a"));'
    25



strcpy
======


.. code-block:: sh
   

    $ ce 'char s[4];strcpy(s, "abc"); p("%s", s);'
    abc



strdup
======


.. code-block:: sh
   

    $ ce 'char* s; if((s=strdup("test")) != NULL){ps(s); free(s);}')'
    Syntax error: ")" unexpected
    



strerror
========


.. code-block:: sh
   

    $ ce 'ps(strerror(1));'
    Operation not permitted



strlen
======

Return the length of string but NULL char is not contained.

.. code-block:: sh
   

    $ ce 'p("%lu", strlen("abc"));'
    3

if adding to the length of the string, you always refer ''

.. code-block:: sh
   

    $ ce 'char *s="abc", *t; t = s + strlen(s); if(!*t) p("NULL");'
    NULL



strmode
=======


.. code-block:: sh
   

    $ ce 'char s[12]; strmode(S_IRWXU | S_IWGRP, s); ps(s);'
    ?rwx-w---- 


.. code-block:: sh
   

    $ ce 'char s[12]; strmode(S_IRWXU | S_IWGRP, s); ps(s[11]==0? "NULL":"NO");'
    NULL



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


.. code-block:: sh
   

    $ ce 'ps(strstr("123456789", "345"));'
    3456789


.. code-block:: sh
   

    $ ce 'ps(strstr("123456789", "355"));'
    (null)

