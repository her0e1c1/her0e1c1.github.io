
(p "部分適応")

(gosh ((pa$ + 10) 5))
(ghc "(10+) 5")
(py "addN=lambda i, n: i+n; add10=functools.partial(addN, 10); P(add10(5))")
