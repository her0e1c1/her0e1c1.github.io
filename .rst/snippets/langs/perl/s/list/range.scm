(load-from-current-dirctory "include-perl.scm")

(ps "range")

(run "perl -E 'say $_ + 1 for 1..10'")
(run "perl -E 'say for 1..3'")
