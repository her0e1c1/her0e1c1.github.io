(load-from-current-dirctory "include-perl.scm")

(ps "group")

(run "perl -E '$_=shift; say if /([\"''])abc\1/ ' '\"abc\"'")
(run "perl -E '$_=shift; say if /([\"''])abc\g1/ ' '\"abc\"'")
(run "perl -E '$_=shift; say if /([\"''])abc\g{1}/ ' '\"abc\"'")
