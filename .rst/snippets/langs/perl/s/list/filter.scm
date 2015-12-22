(load-from-current-dirctory "include-perl.scm")

(ps "filter(grep)")

(run "perl -E 'grep{$_ eq 1} qw(1 2 3) and say 1'")
(run "perl -E 'say grep {$_ % 2 == 0} 1..5'")

(run "perl -E 'say for glob(\"*\")'")
(run "perl -E 'say for map {$_ + 1} 1..3'  # mapの第二引数は配列")
