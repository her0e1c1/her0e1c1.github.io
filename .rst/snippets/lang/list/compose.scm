
(p "f g => (f (g x))")

(gosh ((compose not zero?) 0))
(gosh ((compose not zero?) 1))
(gosh ((pa$ not zero?) 1))
(gosh ((pa$ flip map) (iota 10) print))
(gosh ($ p $ + 1 2 3))
