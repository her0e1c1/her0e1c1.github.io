cd $(dirname $0) > /dev/null 2>&1 && cat <<EOS

===========
 Algorithm
===========

$(goshe '(for-each (^x (load (abs x))) (glob "*.scm"))')

min f(x) = sigma |ai| + s |aj|

min x in Z s.t. x >= a/b

the missing one == ((n+1)n/2 - sigma |aj|)

EOS
