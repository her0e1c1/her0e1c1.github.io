(load-from-current-dirctory "include-perl.scm")

(ps "reduce")

(run "perl -M\"List::Util qw(reduce)\" -E 'say reduce {$a+$b} (1,2,3)'")
