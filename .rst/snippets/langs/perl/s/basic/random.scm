(load-from-current-dirctory "include-perl.scm")

(ps "random")

(run+ "rand(10)")
(run+ "int(rand(10))")

;; use String::Random;
;; String::Random->new->randregex('[A-Za-z0-9]{32}');

(run "perl -E 'say rand for 1..5'")
