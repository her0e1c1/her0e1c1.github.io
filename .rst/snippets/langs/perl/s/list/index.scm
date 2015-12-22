(load-from-current-dirctory "include-perl.scm")

(ps "index")

(run "perl -E '@a=(1, 2, 3); push @a, 4; say @a'")

(run "perl -E 'say 1 if 1 ~~ [1,2,3]'")

(run "perl -E 'say qw/1 2 3/'")

(run "perl -E '@a=(1,2,3); say $#a+1'")

(run "perl -E '@a=(1,2,3); say scalar @a'")
