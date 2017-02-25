
(py "print([1,1,1,2,2,3].count(1))")

(emacs (count 1 '(1 1 1 2 2 3)))
(emacs (--count (evenp it) '(1 2 3 4 5)))


(py "a=[1,1,1,1,1,1]; P(a.count(a[0])==len(a))")
