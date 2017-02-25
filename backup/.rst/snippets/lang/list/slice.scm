(run "perl -E '@a=(split \" \", \"a b c d e\")[2..4]; say @a'")
(emacs (subseq '(1 2 3) 1))


(ps "out of index")
(emacs (subseq '(1 2 3) 3))


(ps "minus")
(run "perl -E '@a=(split \" \", \"a b c d e\")[-1, 0]; say @a'")
(emacs (subseq '(1 2 3) -1))
(emacs (subseq '(1 2 3) -2))
(emacs (subseq '(1 2 3) -3))


(emacs (-slice '(1 2 3 4 5) 2 4))
(emacs (-slice '(1 2 3 4 5) 1))
(emacs (-slice '(1 2 3 4 5) -1))
