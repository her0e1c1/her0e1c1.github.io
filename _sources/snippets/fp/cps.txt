==============
 Continuation
==============

.. contents::


fact.scm
========

.. literalinclude:: ../../src/fp/cps/fact.scm
   :language: scheme


test
----

.. literalinclude:: ../../src/fp/cps/fact.test.scm
   :language: scheme

test result  ::

    test (fact/cps 1), expects 1 ==> ok
    test (fact/cps 10), expects 120 ==> ok



fib.scm
=======

.. literalinclude:: ../../src/fp/cps/fib.scm
   :language: scheme


test
----

.. literalinclude:: ../../src/fp/cps/fib.test.scm
   :language: scheme

test result  ::

    test (fib/cps 0), expects 0 ==> ok
    test (fib/cps 1), expects 1 ==> ok
    test (fib/cps 2), expects 1 ==> ok
    test (fib/cps 8), expects 21 ==> ok
    test (fib/cps 10), expects 55 ==> ok



leaf-count.scm
==============

.. literalinclude:: ../../src/fp/cps/leaf-count.scm
   :language: scheme




flatten.scm
===========

.. literalinclude:: ../../src/fp/cps/flatten.scm
   :language: scheme


test
----

.. literalinclude:: ../../src/fp/cps/flatten.test.scm
   :language: scheme

test result  ::

    test (flatten/cps X), expects () ==> ok
    test (flatten/cps X), expects (a b c) ==> ok
    test (flatten/cps X), expects (a b c d e f g h) ==> ok
    test (flatten/cps X), expects (a b c d e f g h) ==> ok

