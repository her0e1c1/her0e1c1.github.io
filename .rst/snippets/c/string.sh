HERE=$(dirname $0)
cat <<EOF

==================
 Implement Vector
==================

I wrote a simple vector in C.

Here are features of a vector.
If you want to get more in detail, go to each of the page links.

.. contents::

$(go <<EOG
 (define ROOT "$HERE/../../")
 ((flip$ map) (sphinx "/src/c/string.c" :cd ROOT)
  (^(alist)
    (let* ((g (pa$ assoc-ref alist))
           (name (g 'name))
           (func (sphinx-block (g 'func) :code-block "c"))
           (underscore (make-string (string-length name) #\=))
           (path-test (f-join ROOT "src/c/string" #"~|name|.c"))
           (result-test (or (shinx-section-test path-test :language "c") ""))
           )
      (print #"
~name
~underscore
~func
~result-test
"))))
EOG
)

All source code
===============

.. literalinclude:: /src/c/string.c
   :language: c
   :linenos:

EOF
