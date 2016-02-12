
(py "P([i for i in [1,2,3,4,5] if i % 2 == 0])")
(node "P([1,2,3,4,5].filter(function(elem, index, array){return elem % 2 == 0;}))")
(node "P([1,2,3,4,5].filter(x => x % 2 == 0))")
(perl "say join qq/, /, grep {$_ % 2 == 0} 1..5")

(gosh (filter #/^..$/ (glob "*")))
(gosh (filter ($ not $ odd? $) (iota 5)))
(gosh (filter (.$ not odd?) (iota 5)))

(emacs (--remove (evenp it) '(1 2 3 4 5)) :msg "条件に合致したら、残す")
(emacs (--filter (evenp it) '(1 2 3 4 5)) :msg "条件に合致したら、除外")
(emacs (remove-if #'evenp '(1 2 3 4 5)))
