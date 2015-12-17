(load-from-current-dirctory "include.scm")
(define run oneliner-run+)

(run "python -c 'print(all(i % 2 == 0 for i in [0,2,4]))'")
(run "python -c 'print(any(i % 2 == 0 for i in [1,2,3]))'")
(run "python -c 'a=[1,2,3]; a.append(4); print(a)'")
(run "python -c 'cons=lambda a,b: [a] + b; print(cons(1, [2,3]))'")

(p "リスト作成の場合、第二引数はリストである必要がある")
(run "python -c 'print([1,1,1,2,2,3].count(1))'")

(p "リストの中で、指定した要素の数を返す")
(run "python -c 'print([1,2,3][1:])'")
(run "python -c 'for i in range(3): print(i)'")
(run "python -c 'print(1 in [1,2,3])'")
(run "python -c 'print([i for i in [1,2,3,4,5] if i % 2 == 0])'")


(run "python -c 'from functools import reduce; flatten=lambda i:reduce(lambda a,b:a+(flatten(b)if hasattr(b,'__iter__')else[b]),i,[]); print(flatten([[1,2,3], 4, [5, [6], 7]]))'")
;# reduceの第三引数に初期値を指定できる
; python2 -c 'print(reduce(lambda a,b: [b]+a, [1,2,3], []))'
; python2 -c 'print(reduce(lambda a,b: a+b, [1,2,3]))'

(run "python -c 'import itertools as i; print(list(list(l) for _, l in i.groupby([1,1,1,2,2,3])))'")
(run "python -c 'import itertools as i; from collections import OrderedDict; print(OrderedDict([(pid, list(gen)) for pid, gen in i.groupby([1,1,1,2,2,3])]))'")
(run "python -c 'print([1,2,3][0])'")
(run "python -c 'print(\"hello world\")'")
(run "python -c 'print([1,2,3][1])'")
(run "python -c 'print([1,2,3])'")
(run "python -c 'print([1,2,3][-1])'")
(run "python -c 'print(len([1,2,3]))'")
(run "python -c 'import os; print(\"\n\".join(os.listdir(\".\")))'")
(run "python -c 'print(set([1,1,1,2,2,3]))'")
(run "python -c 'print([1] * 3)'")
(run "python -c 'print([1,2,3] * 3)'")
(run "python -c 'print(\"\".join(reversed(\"hoge\")))'")
(run "python -c 'a=[1,2,3]; a.reverse(); print(a)'")
(run "python -c 'print(list(reversed([1,2,3])))'")
(run "python -c 'print(sorted([1, 4, 2, 5, 6, 7, 3]))'")
(run "python -c 'print([1,2,3,4,5][1:])'")
(run "python -c 'print(\" \".join([\"%s.%s\" % (x,y) for x in [\"a\", \"b\", \"c\"] for y in [\"txt\", \"csv\"]]))'")
(run "python -c 'print(list(zip(*[(1,4),(2,5),(3,6)])))'")
