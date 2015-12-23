
(ps "env")


(run "perl -E 'say for split \":\", $ENV{PATH}'")
