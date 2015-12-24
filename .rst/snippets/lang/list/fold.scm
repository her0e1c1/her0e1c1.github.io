
(run "python2 -c 'print(reduce(lambda a,b: [b]+a, [1,2,3], []))'" :msg "reduceの第三引数に初期値を指定")
(run "python2 -c 'print(reduce(lambda a,b: a+b, [1,2,3]))'")
(node "[1,2,3].reduce(function(a,b){return a+b;})")
(run "perl -M\"List::Util qw(reduce)\" -E 'say reduce {$a+$b} (1,2,3)'")
(run "ghc -e 'foldl (flip (:)) [] [1,2,3]'")
(run "ghc -e 'foldl1 (+) [1,2,3]'")

(gosh (fold (^(a b) (cons a b)) '() (i 10)))
