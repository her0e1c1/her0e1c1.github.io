cd $(dirname $0) > /dev/null 2>&1 && cat <<EOS

============
C++ Language
============

$(goshe '(sphinx-import-each-directory "s")')

EOS

# template <class T1,class T2>
# pair<T1,T2> make_pair (T1 x, T2 y) {
#   return ( pair<T1,T2>(x,y) );
# }

# :FreeBSD: ``usr/src/contrib/libc++``
# vectorなどの実装は、 `/usr/src/contrib/libc++/include/vector` あたりにある

# cpe 'P(isatty(10))'  ; 単純にwrapしてるだけ
