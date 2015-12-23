;; # (?P<NAME>REGEX)でグループに名前をつける
;; # (?P=NAME)で参照(内部参照)

(run "perl -E '$_=shift; say qq/$+{name}/ if /(?P<name>a)/ ' a")

(run "perl -E '$_=shift; say if /(?P<name>a)b\g{name}/ ' aba")
(run "perl -E '$_=shift; say if /(?P<name>a)b(?P=name)/ ' aba")
(run "python -c \"import re; print(re.match(r'(?P<name>a)b(?P=name)', 'aba').group())\"")
