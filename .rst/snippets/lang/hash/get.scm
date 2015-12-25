
(ps "get")

(py "P({\"a\": 1, \"b\": 2}[\"a\"])")
(node "P({a: 1, b: 2}.a)")
(node "P({a: 1, b: 2}[a])")
(node "P({a: 1, b: 2}['a'])")

(run "perl -E '%a=(a=>1, b=>2); say $a{a}'")

(zsh "typeset -A y; y=(a 1 b 2 c 3); echo $y[a]")
(zsh "typeset -A y; y=(a 1 b 2 c 3); echo ${${(@M)y}[1]}")


(gosh (assq 'a '((a 1) (b 2) (c 3))))
(gosh (assq 'HOGE '((a 1) (b 2) (c 3))))

(gosh (let1 t (make-hash-table)
            (hash-table-get t 'no-key))
:msg "存在しないものを参照するとエラー")

(gosh (let1 t (make-hash-table)
            (p (hash-table-get t 'no-key 'VALUE))))

(gosh (assoc-ref '((a . 1)) 'a))
(gosh (assoc-ref '((a . 1)) 'b))
