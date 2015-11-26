SRC="../../src/fp/cps"

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
  (glob"$SRC/*"))
EOG
)

EOF
