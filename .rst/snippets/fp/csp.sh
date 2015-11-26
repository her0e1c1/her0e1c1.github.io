cat <<EOF
==============
 Continuation
==============

.. contents::

$(gosh <<EOG
 (for-each (^ (path)
  (let* [(name (sys-basename path))
         (underscore (make-string (string-length name) #\=))]
   (print #"
~name
~underscore

.. literalinclude:: ~|path|
   :language: scheme
")))
  (glob "$SNIPPETS_SRC/fp/cps/*.scm"))
EOG
)

EOF
