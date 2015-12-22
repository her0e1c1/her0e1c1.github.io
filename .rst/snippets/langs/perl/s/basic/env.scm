(load-from-current-dirctory "include-perl.scm")

(ps "env")

(run "perl -E 'say for split \":\", $ENV{PATH}'")
