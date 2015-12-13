HERE=$(dirname $0)
cat <<EOF
==============
 Continuation
==============

.. contents::

$(gosh -l ~/lib/scheme/init.scm <<EOG
 (current-directory "$HERE")
 (define (test-name name)
   (regexp-replace #/.scm$/ name ".test\\\\0"))
 (for-each (^ (path)
  (let* [(name (sys-basename path))
         (section (sphinx-section name))
         (test-result (sphinx-section-test (test-name path)))
         ]
   (print #"
~section
~test-result
")))
  (filter (.$ not #/.test.scm$/) (glob "*.scm")))
EOG
)

EOF
