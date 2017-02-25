
(run "python -c 'import re; print(re.match(r'''([\"''])abc\1''', '''\"abc\"''').group())'")

(run "perl -E '$_=shift; say if /([\"''])abc\1/ ' '\"abc\"'")
(run "perl -E '$_=shift; say if /([\"''])abc\g1/ ' '\"abc\"'")
(run "perl -E '$_=shift; say if /([\"''])abc\g{1}/ ' '\"abc\"'")

(run "perl -E 'qq/1234/ =~ /((((1)2)3)4)/; say qq/$1 $2 $3 $4/'"
     :msg "順番は左から")

(p "(?(NUMBER)REGEX)  If the group NUMBER is matched, REGEX is active")
(run "perl -E 'say $& if shift =~ /(<)\w+@\w+(?:\.\w+)+(?(1)>)/' '<abc@aaa.com>'")


(ps "group index")
(py "P(re.match(r'(((1)2)3)', '123').groups())")

(eval-null
 `(begin ,@(map
            (^x `(emacs (progn (let ((s "123"))(string-match "\\(\\(\\(1\\)2\\)3\\)" s) (match-string ,x s)))))
         (iota 5))))
