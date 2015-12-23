

(ps "Don't use double quote which extend $ in sh or escape it")
(run "perl -e \"$a=1; print $a\"")
(run "perl -e \"\\$a=1; print \\$a\"")

(ps "escape quote in sh")
(run "perl -E 'say'\\''HOGE HOGE'\\'''")
