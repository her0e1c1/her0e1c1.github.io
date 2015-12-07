HERE=$(dirname $0)
cat <<EOF
==============
 Continuation
==============

.. contents::

$(gosh <<EOG
 (use gauche.process)
 (define (test-name name)
   (regexp-replace #/.scm$/ name ".test\\\\0"))
 (define (show-test path shpinx-path)
   (if-let1 result-lines
            (and-let* ((ok (file-exists?  path))
                       (result (process-output->string-list #"gosh ~path"))
                       (lines (map (^x (string-append "    " x)) result)))
                      (string-join lines "\n"))
   #"
test
----

.. literalinclude:: ~|shpinx-path|
   :language: scheme

test result `~shpinx-path` ::

~result-lines
" ""))
 (for-each (^ (path)
  (let* [(name (sys-basename path))
         (sphinx-path #"../../src/fp/cps/~|name|")
         (sphinx-test-path (test-name sphinx-path))
         (test-result (show-test (test-name path) sphinx-test-path))
         (underscore (make-string (string-length name) #\=))]
   (print #"
~name
~underscore

.. literalinclude:: ~|sphinx-path|
   :language: scheme

~test-result
")))
  (filter (.$ not #/.test.scm$/) (glob "$HERE/../../src/fp/cps/*.scm")))
EOG
)

EOF
