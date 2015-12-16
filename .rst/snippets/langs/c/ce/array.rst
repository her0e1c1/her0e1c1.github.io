
=======
 Array 
=======



argument
========

argc

.. code-block:: sh
   

    $ ce 'p("%d", argc);' 1 2 3 4 5
    6

argv is a list of argument strings. they are stored in memory. the last item is NULL
you can also say like char** is [String]

.. code-block:: sh
   

    $ ce 'while(*argv){p("%s ", *argv); argv++;}' 1 2 3
    /tmp/tmp.t2lQ6Zra 1 2 3 

Increment pointer. ++ and +=1 are no different. btw argv[0] is exec path.

.. code-block:: sh
   

    $ ce 'argv += 1; p("%s", *argv);' first
    first

Get the last item

.. code-block:: sh
   

    $ ce 'p("%s", argv[argc - 1]);' first secomd last
    last



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



environ
=======

Get values of evriron

.. code-block:: sh
   

    $ ce 'char**e=environ;while(*e){if(!strcmp(*e, "USER=me"))p("%s", *e); e++;}'
    USER=me

l list, v vector, e env


exel
====

exec path and its arguments. the list must be end with NULL.

.. code-block:: sh
   

    $ ce 'execv("/bin/echo", (char*[]){"ECHO", "abc", "efg", NULL});'
    abc efg
    


.. code-block:: sh
   

    $ ce 'execv("/bin/echo", (char*[]){"/bin/echo", "abc", "efg", NULL});'
    abc efg
    


.. code-block:: sh
   

    $ ce 'execv("echo", (char*[]){"ECHO", "abc", "efg", NULL});'
    

you don't need an absolute path because it searches PATH for the command.

.. code-block:: sh
   

    $ ce 'execlp("echo", "ECHO", "hoge", NULL);'
    hoge
    


.. code-block:: sh
   

    $ ce 'execvp("echo", (char*[]){"ECHO", "hoge", NULL});'
    hoge
    



exit
====


.. code-block:: sh
   

    $ ce 'p("%d", EXIT_SUCCESS);'
    0


.. code-block:: sh
   

    $ ce 'p("%d", EXIT_FAILURE);'
    1


.. code-block:: sh
   

    $ ce 'exit(EXIT_SUCCESS); p("NOT REACHED");'
    



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
    



env
===


.. code-block:: sh
   

    $ ce 'p("%s", getenv("USER"));'
    me

NULL if the name doesn't exist.

.. code-block:: sh
   

    $ ce 'p("%s", getenv("user"));'
    (null)



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
   

    $ ce 'p("%zu", sizeof(short int));'
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



statfs
======


.. code-block:: sh
   

    $ ce 'struct statfs s; statfs("/home", &s); p("%s", s.f_mntonname);'
    /



struct
======


.. code-block:: sh
   

    $ ce 'typedef struct {char name[64];}S; S s; strcpy(s.name, "Bob"); p("%s", s.name);'
    Bob


.. code-block:: sh
   

    $ ce 'typedef struct {unsigned bool: 1;}Bool; Bool b; b.bool=0; p("%d", b.bool);'
    0


.. code-block:: sh
   

    $ ce 'typedef struct {unsigned bool: 1;}Bool; Bool b; b.bool=1; p("%d", b.bool);'
    1


.. code-block:: sh
   

    $ ce 'typedef struct {unsigned bool: 1;}Bool; Bool b; b.bool=2; p("%d", b.bool);'
    <stdin>:42:59: warning: implicit truncation from 'int' to bitfield changes value from 2 to 0 [-Wbitfield-constant-conversion]
        typedef struct {unsigned bool: 1;}Bool; Bool b; b.bool=2; p("%d", b.bool);
                                                              ^~
    1 warning generated.
    0



ttyname
=======

stdin 0, stdout 1, stderr 2
in this case, because I run this command as subprocess, these results are NULL.

.. code-block:: sh
   

    $ ce 'p("%s", ttyname(0));'
    (null)


.. code-block:: sh
   

    $ ce 'p("%s", ttyname(1));'
    (null)


.. code-block:: sh
   

    $ ce 'p("%s", ttyname(2));'
    (null)

