
(run "python -c 'a=[1,2,3]; a.append(4); print(a)'")
(run "perl -E '@a=(1, 2, 3); push @a, 4; say @a'")

(node "a=[1,2,3]; a.push(4); console.log(a)")
(cpp "list<int> l; REP(i, 3) l.push_back(i);")

(emacs (add-to-list '(1 2 3) 4)
       :warn "add-to-listは、必ず変数に対して実行する必要がある")
(emacs (let ((a1 '(1 2 3))) (add-to-list 'a1 4)))
