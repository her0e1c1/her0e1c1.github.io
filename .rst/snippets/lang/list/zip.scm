
(run "python -c 'print(list(zip(*[(1,4),(2,5),(3,6)])))'")
(gosh (zip '(1 2 3) '(4 5 6)))
(emacs (-zip '(1 2 3) '(4 5 6)))

; 要素数が同じでない場合は、短いリストにあわせる
(emacs (-zip '(1) '(4 5 6)))

(ps "split 15 items to 3 groups")
(py "P(list(zip(*[iter(range(15))]*5)))")
