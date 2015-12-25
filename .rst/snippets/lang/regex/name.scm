;; # (?P<NAME>REGEX)でグループに名前をつける
;; # (?P=NAME)で参照(内部参照)

(run "perl -E '$_=shift; say qq/$+{name}/ if /(?P<name>a)/ ' a")

(run "perl -E '$_=shift; say if /(?P<name>a)b\g{name}/ ' aba")
(run "perl -E '$_=shift; say if /(?P<name>a)b(?P=name)/ ' aba")
(run "python -c \"import re; print(re.match(r'(?P<name>a)b(?P=name)', 'aba').group())\"")

(run "perl -E '$_=shift; say if m#^(?P<year>\d{4})(?P<d1>[-/])(?P<month>\d{1,2})\g{d1}(?P<day>\d{1,2})\s+(?P<hour>\d{1,2})(?P<d2>:)(?P<minute>\d{1,2})\g{d2}(?P<second>\d{1,2})$#' '2015-05-22 13:59:04'")

(run "perl -E '$_=shift; /(?<l>.*?line)/ and say $+{l}' 'aaalinebbb'")
