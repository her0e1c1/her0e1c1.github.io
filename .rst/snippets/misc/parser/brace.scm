
(p "(()())といった文字列のパーサーを作成")

(p "
S -> A B
A -> B
B -> { S } | e
")

(math "
f(i, stack) = $begin{cases}
1 & ($mbox{stack is empty and i = n})
f(i+1, cons(a_i, stack)) & (open a_i)
0 & ($mbox{stack is empty})
f(i+1, cdr(stack)) & (close a_i = car(stack))
0 & (else)
$end{cases}
")
