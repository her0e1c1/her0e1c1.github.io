cd $(dirname $0) > /dev/null 2>&1 && cat <<EOS

===========
 Algorithm
===========

$(goshe '(print (sphinx-toctree-directory "sort"))')

..
    min f(x) = sigma |ai| + s |aj|

    min x in Z s.t. x >= a/b

    the missing one == ((n+1)n/2 - sigma |aj|)

    #{i| A<=i<=B, i mod K = 0}
    A = km + n <= K*j <=B = km' + n'
    <=> m + n/k <= j <= m' + n'/k
    0 <= n/k, n'/k < 1
    j in (m, m']
    j in [m, m'] if n/k == 0

    (B / K) - (A / K) + (A % K == 0 ? 1 : 0);



    0 <= i < Nのとき
    Si = a0 + ... + ai
    をまとめて求める.

    A<=i<=B => (B-A+1)
    A<i<B => (B-A-1)

    prefix sum == scan

    triplet
    max(A[i] * A[j] * A[k]) == A.sort() (0,1,-1) (-1,-2,-3)

    三角形の存在条件
    sorted(A); A[i] + A[i+1] > A[i+2]

    parse
    "(()(())())"
    parse
    "(()){[]}"


EOS
