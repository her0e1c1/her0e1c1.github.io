(load-from-current-dirctory "include-perl.scm")

(ps "join")

(run "perl -E 'say join \" \" , map {sprintf \"%03d\", $_} 1..10'")
