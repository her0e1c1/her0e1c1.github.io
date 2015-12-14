
=======
 Array 
=======

Declare


.. code-block:: sh
   

    $ ce 'int a[10];'
    



.. code-block:: sh
   

    $ ce 'static int a[10];'
    



.. code-block:: sh
   

    $ ce 'int a[] = {1,2,3};'
    



.. code-block:: sh
   

    $ ce 'int a[] = {1,2,3}; int *b=a;'
    

However you can't assign a vector to a pointer directly.


.. code-block:: sh
   

    $ ce 'int *a  = {1,2,3};'
    <stdin>:38:16: warning: incompatible integer to pointer conversion initializing 'int *' with an expression of type 'int' [-Wint-conversion]
        int *a  = {1,2,3};
                   ^
    <stdin>:38:18: warning: excess elements in scalar initializer
        int *a  = {1,2,3};
                     ^
    2 warnings generated.
    

Initialize a 2D array


.. code-block:: sh
   

    $ ce 'int a[10][10] = {10}; p("%d", a[0][0]);'
    10

Initialize a 2D array


.. code-block:: sh
   

    $ ce 'int a[10][10] = {{ 0 }}; p("%d", a[0][0]);'
    0

valc. so you can allocate memroy dynamically even if it is an array


.. code-block:: sh
   

    $ ce 'int k=10; int a[k];'
    

But with static, an error occurs


.. code-block:: sh
   

    $ ce 'int k=10;static int a[k];'
    <stdin>:38:25: error: variable length array declaration can not have 'static' storage duration
        int k=10;static int a[k];
                            ^ ~
    1 error generated.
    



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

Normalize path. I think return value is the same as a buff-stored value.


.. code-block:: sh
   

    $ ce 'char s[PATH_MAX]; p("%s", realpath("/home/../home/././.", s));'
    /usr/home

printf doesn't output until it encounters newline. an error will occur because of referring null pointer


.. code-block:: sh
   

    $ ce 'char*a=NULL, b; p("this is NOT printed."); b=*a;'
    



.. code-block:: sh
   

    $ ce 'char*a=NULL, b; p("this is printed."); fflush(stdout); b=*a;'
    this is printed.

