
==================
 Implement Vector
==================

I wrote a simple vector in C.

Here are features of a vector.
If you want to get more in detail, go to each of the page links.

- indexAt_ O(1)
- insertAt_ O(n)
- deleteAt_ O(n)

header
======

.. literalinclude:: /sample/share/include/vector.h
   :language: c

indexAt
=======

Refer nth element.

Using a vector, you can access an element of it for a constant time.

.. literalinclude:: /sample/share/vector/indexAt.c
   :language: c

insertAt
========

You need to move an element one by one from index.
So complexity is O(n)

.. literalinclude:: /sample/share/vector/insertAt.c
   :language: c

deleteAt
========

.. literalinclude:: /sample/share/vector/deleteAt.c
   :language: c
