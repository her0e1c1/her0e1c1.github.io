
(run "python -c 'import re; print(re.match(r'''([\"''])abc\1''', '''\"abc\"''').group())'")
(run "python -c 'import re; print(re.match(r\"((((1)2)3)4)\", \"1234\").groups())'")

(run "perl -E '$_=shift; say if /([\"''])abc\1/ ' '\"abc\"'")
(run "perl -E '$_=shift; say if /([\"''])abc\g1/ ' '\"abc\"'")
(run "perl -E '$_=shift; say if /([\"''])abc\g{1}/ ' '\"abc\"'")

(run "perl -E 'qq/1234/ =~ /((((1)2)3)4)/; say qq/$1 $2 $3 $4/'"
     :msg "順番は左から")
