
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

