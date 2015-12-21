cd $(dirname $0) > /dev/null 2>&1 && cat <<EOS

============
C++ Language
============

$(goshe '
 (let ((f (^x
          (let1 it (join-line (list (sphinx-section x :up #t) (sphinx-contents :depth 2)))
           (print (sphinx-include-scm-list (sort (glob #"./~|x|.scm")) #"~|x|.rst" :header it))))))
 (for-each ($ ignore $ f $) (list "vector" "string"))
 )
')

EOS

# template <class T1,class T2>
# pair<T1,T2> make_pair (T1 x, T2 y) {
#   return ( pair<T1,T2>(x,y) );
# }

# :FreeBSD: ``usr/src/contrib/libc++``
# vectorなどの実装は、 `/usr/src/contrib/libc++/include/vector` あたりにある
