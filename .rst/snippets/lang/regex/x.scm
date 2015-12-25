
(p "with x option, ignore whitespace")

(run "perl -E '$_=\"abc\"; /a   b c/x; say $&'")
(py "P(match(r'a   b c', 'abc', X))")
