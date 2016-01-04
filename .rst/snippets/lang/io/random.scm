
(p "Return a value between 0 and 1 (not including 1)")
(node "Math.random()")
(p "Return a value from 0 to 6")
(node "Math.floor(Math.random() * 7)")

(perl "rand(10)")
(perl "int(rand(10))")
(run "perl -E 'say rand for 1..5'")
;; use String::Random;
;; String::Random->new->randregex('[A-Za-z0-9]{32}');

(gosh (sys-random))

(c "P(\"%d\", RAND_MAX);" :msg "rand returns a 0 to RAND_MAX integer")
(c "srand(time(NULL));P(\"%d\", rand());")

(ps "get an integer from A to B")
(c "P(\"%d\", rand() % (B - A + 1) + A);")
