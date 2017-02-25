
(p "後に続く文字列が条件に合致した場合に、その手前にマッチさせる")

(run "perl -E '$_=shift; say $& if /abc(?=def)/' abcdef")
(run "perl -E '$_=shift; say $& if /abc(?=def)/' abcdf" :msg "No match")
(run "python -c 'import re; print(re.match(r\"abc(?=def)\", \"abcdef\").group())'")
(gosh (p ((#/abc(?=def)/ "abcdef") 0)))
