

(run "perl -E 'shift =~ /(a)(?:b)(c)/; say $1.$2' abc")
(run "python -c 'import re; print(re.match(r\"(a)(?:b)(c)\", \"abc\").groups())'")
; 後に続く文字列が条件に合致した場合に、その手前にマッチさせる
