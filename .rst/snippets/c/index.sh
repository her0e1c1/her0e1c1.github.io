HERE=$(dirname $0)
cat <<EOS

=======
C lang
=======

.. toctree::

   vector
   string

$(go <<EOG
 (current-directory "$HERE")
 (define dst "macro.c")
 (p (sphinx-block-path dst :linenos #t))
 (p (sphinx-block (run-c dst) :block #t))

EOG
)

EOS
