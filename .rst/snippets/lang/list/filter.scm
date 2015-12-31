
(run "python -c 'print([i for i in [1,2,3,4,5] if i % 2 == 0])'")

(node "[1,2,3,4,5].filter(function(elem, index, array){return elem % 2 == 0;})")

(run "perl -E 'grep{$_ eq 1} qw(1 2 3) and say 1'")
(run "perl -E 'say grep {$_ % 2 == 0} 1..5'")

(gosh (filter #/^..$/ (glob "*")))
(gosh (filter ($ not $ even? $) (i 10)))
(gosh (filter (.$ not even?) (i 10)))

(emacs (--remove (evenp it) '(1 2 3 4 5)) :msg "条件に合致したら、残す")
(emacs (--filter (evenp it) '(1 2 3 4 5)) :msg "条件に合致したら、除外")
(emacs (remove-if #'evenp '(1 2 3 4 5)))
