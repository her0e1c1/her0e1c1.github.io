
(run "perl -E '@a=(split \" \", \"a b c d e\")[2..4]; say @a'")
(run "perl -E '@a=(split \" \", \"a b c d e\")[-1, 0]; say @a'")