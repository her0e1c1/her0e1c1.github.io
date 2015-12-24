
(run "python -c 'print(len([1,2,3]))'")
(ghc "length [1,2,3]")
(node "[1,2,3].length")

(run "perl -E '@a=(1,2,3); say $#a+1'")
(run "perl -E '@a=(1,2,3); say scalar @a'")

(c "#define SIZE(x) (sizeof(x) / sizeof(x[0]))\n int a[] = {1,2,3}; p(\"%d\", SIZE(a));")

(zsh "a=(a b c d e); echo $#a")
