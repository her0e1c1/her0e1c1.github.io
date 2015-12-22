
;return the list that min
(--min-by (> (-sum it) (-sum other)) '((1 2 3) (4 5 6) (7 8 9)))
(--max-by (> (-sum it) (-sum other)) '((1 2 3) (4 5 6) (7 8 9)))

;(-unfold '1+ 1 10)

(-cons* 1 2 3 4 5 '(6 7 8))
(-snoc '(1 2 3) 4 5 6)