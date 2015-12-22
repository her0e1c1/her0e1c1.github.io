(load-from-current-dirctory "include-perl.scm")

(p"d option
delete it if you cant map a char")

(run "perl -E '$_=qq/abc/; tr/ac/A/d; say'")
