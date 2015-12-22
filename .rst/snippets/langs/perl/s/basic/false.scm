(load-from-current-dirctory "include-perl.scm")

(ps "false")
(run "perl -E 'say $a || \"\" || 0'")
