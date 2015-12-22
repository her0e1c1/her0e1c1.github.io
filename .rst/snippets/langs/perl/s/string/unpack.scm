(load-from-current-dirctory "include-perl.scm")

(ps "unpack")

(run "perl -le 'print unpack(\"H*\", $ARGV[0]);' 'あいうえお' ")

(run "perl -E 'say unpack(\"B*\", \"A\");'")
