

(run "perl -E 'say sprintf(\"%s, %s\", \"hello\", \"world\")'")

(run "perl -le 'print unpack(\"H*\", $ARGV[0]);' 'あいうえお' ")
(run "perl -E 'say unpack(\"B*\", \"A\");'")
