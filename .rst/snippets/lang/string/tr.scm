
(run "perl -E '$_=qq/abc/; tr/ac/A/d; say'"
     :msg "d option is to delete it if you cant map a char")

;; # big <=> small
;; perl -E 'tr/a-zA-Z/A-Za-z/'

;; # s option
;; # map continuous chars as one char to another char
;; perl -E '$_="aaabc"; tr/ac/A/s; say'  # AbA
