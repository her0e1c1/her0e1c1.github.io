(load-from-current-dirctory "include.scm")

(define run oneliner-run+)
(define ps ($ print $ sphinx-section $))

(ps "2の倍数")
(run "echo 124 | perl -nlE 'say if /\d*[24680]$/'")
(run "echo 123 | perl -nlE 'say if /\d*[24680]$/'")

(ps "ConvertTabToTwoSpaces")
(run "perl -pE 's/\t/  /' s1.txt")

(ps "Get basename")
(run "echo /path/to/base.txt |perl -nlE 's#(.*/)## and say'")

(ps "Get dirname")
(run "echo /path/to/base.txt |perl -nlE 'm#(.*/)# and say $1'")

(ps "Get ext")
(run "echo /path/to/base.txt |perl -nlE 'm#.*[.](.*)# and say $1'")

(ps "\2に'がマッチ、$4に'>がマッチ")
; (run "perl -E '$_=shift; s#(<a.*?href=([\"'']))(.*?)(\2.*?>)#$1$3/$4# and say' \"<a href='/path/to'>\"")
