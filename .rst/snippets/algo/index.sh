cd $(dirname $0) > /dev/null 2>&1 && cat <<EOS

===========
 Algorithm
===========

..
    the missing one == ((n+1)n/2 - sigma |aj|)

    prefix sum == scan

    三角形の存在条件
    sorted(A); A[i] + A[i+1] > A[i+2]

    parse
    "(()(())())"
    parse
    "(()){[]}"

    Prim

$(goshe '(sphinx-create-index-in-directory (glob "*")) ""')
$(goshe '(print (sphinx-toctree-directory. (glob "*")))')

EOS
