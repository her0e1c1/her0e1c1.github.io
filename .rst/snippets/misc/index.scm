cd $(dirname $0) > /dev/null 2>&1 && cat <<EOS

====
Misc
====

(goshe '(p (sphinx-toctree :glob "ce/*"))')
$(goshe '
 (let ((f (^x
          (let1 it (join-line (list (sphinx-section x :up #t) (sphinx-contents :depth 2)))
           (print (sphinx-include-scm-list (sort (glob #"./s/~|x|/*.scm")) #"~|x|.rst" :header it))))))
; (for-each ($ ignore $ f $) (list "array" "string" "grammer" "stdlib" "misc"))
 (for-each ($ ignore $ f $) (list "oneliner"))
 )
')

EOS
