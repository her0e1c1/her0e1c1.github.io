


(p "Return a value between 0 and 1 (not including 1)")
(node "Math.random()")
(p "Return a value from 0 to 6")
(node "Math.floor(Math.random() * 7)")



(perl "rand(10)")
(perl "int(rand(10))")
;; use String::Random;
;; String::Random->new->randregex('[A-Za-z0-9]{32}');
(run "perl -E 'say rand for 1..5'")
