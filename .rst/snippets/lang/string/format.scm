
(run "perl -le 'print unpack(\"H*\", $ARGV[0]);' 'あいうえお' ")
(run "perl -E 'say unpack(\"B*\", \"A\");'")


(gosh (format #t "~D ~B ~O ~X" 256 256 256 256))
(gosh (format #f "~b ~b" #b1101001 100))

(p "break line")
(gosh (format "~%"))

(ps "sprintf")
(p "Number to string")
(c "char b[32]; sprintf(b, \"%d\", 12345); p(\"%s\", b);")

(run "perl -E 'say sprintf(\"%s, %s\", \"hello\", \"world\")'")
