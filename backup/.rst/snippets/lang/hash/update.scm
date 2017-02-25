
(node "a={a:1};a[a]=2;P(a[a])")
(cpp "map<string, int>m={{\"a\", 1}}; m[\"a\"]=2; P(m[\"a\"])")

(gosh (let1 a '((a 1) (b 2) (c 3))
            (set-car! (assq 'a a) '(10))
            (p a)))

(gosh (let1 t (make-hash-table)
            (hash-table-put! t 'k 1)
            (describe t)))
