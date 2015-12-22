(load-from-current-dirctory "include-perl.scm")

(ps "hello")

(run "perl -e 'print \"hello world\"'")

(run "perl -e 'print qq/hello world/'")

(run "perl -E 'say \"hello world\"'")

