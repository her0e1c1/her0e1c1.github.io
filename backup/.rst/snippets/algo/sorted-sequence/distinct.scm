
(ps "重複を許した要素を持つ集合の区別できる要素の個数")

(p "ソート配列に対して、現在の値nを保持しておく")

(math "
f(i, n) = $begin{cases} 0 (i = 0)
f(i-1, a_i) + 1 & (n = a_i)
f(i-1, n) & (else)
$end{cases}
")
