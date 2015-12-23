
(p "use : for no capture")
(run "perl -E 'shift =~ /(a)(?:b)(c)/; say $1.$2' abc")
(py "P(match(r\"(a)(?:b)(c)\", \"abc\").groups())")
