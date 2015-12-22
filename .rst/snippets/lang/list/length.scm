
(run "python -c 'print(len([1,2,3]))'")

;; ghc -e 'length [1,2,3]'

(node "[1,2,3].length")


(run "perl -E '@a=(1,2,3); say $#a+1'")
(run "perl -E '@a=(1,2,3); say scalar @a'")
