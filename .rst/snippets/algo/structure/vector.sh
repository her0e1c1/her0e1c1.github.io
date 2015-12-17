HERE=$(dirname $0)
cat <<EOF

==================
 Implement Vector
==================

I wrote a simple vector in C.

Here are features of a vector.
If you want to get more in detail, go to each of the page links.

.. contents::

$(gosh -l ~/lib/scheme/init.scm <<EOG
 (define ROOT "$HERE/../../")
 ((flip$ map) (sphinx "/src/c/vector.c" :cd ROOT)
  (^(alist)
    (let* ((g (pa$ assoc-ref alist))
           (name (g 'name))
           (section (sphinx-section name))
           (func (sphinx-block (g 'func) :code-block "c"))
           (path-test (f-join ROOT "src/c/vector" #"~|name|.c"))
           (result-test (or (shinx-section-test path-test :language "c") ""))
           )
      (print #"
~section
~func
~result-test
"))))
EOG
)

All source code
===============

.. literalinclude:: /src/c/vector.c
   :language: c
   :linenos:

EOF
