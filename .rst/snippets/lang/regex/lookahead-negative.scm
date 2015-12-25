
(p "if string does not match (?!...), then match")

(pw "If thare is same notation, the result is different?")

(py "P(match(r\"(?!abc)def\", \"abcdef\"))")
(py "P(match(r\"(?!abc)def\", \"ABCdef\"))")
(py "P(match(r\"abc(?!def)\", \"abcdef\"))")
(py "P(match(r\"abc(?!def)\", \"abcDEF\"))")

(perl "$_=q/abcdef/; say if /(?!abc)def/")
(perl "$_=q/ABCdef/; say if /(?!abc)def/")
(perl "$_=q/abcdef/; say if /abc(?!def)/")
(perl "$_=q/abcDEF/; say if /abc(?!def)/")

(gosh (p (#/(?!abc)def/ "abcdef")))
(gosh (p (#/(?!abc)def/ "ABCdef")))
(gosh (p (#/abc(?!def)/ "abcdef")))
(gosh (p (#/abc(?!def)/ "abcDEF")))
