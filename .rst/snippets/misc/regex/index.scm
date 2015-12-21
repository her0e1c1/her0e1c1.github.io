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

;;  perl -E "\$_=shift; say if m#$__REGEX_DATETIME#" "2015-05-22 13:59:04"
;; __REGEX_DATETIME='^(?P<Y>\d{4})(?P<d1>[-/])(?P<m>\d{1,2})\g{d1}(?P<d>\d{1,2})\s+(?P<H>\d{1,2})(?P<d2>:)(?P<M>\d{1,2})\g{d2}(?P<S>\d{1,2})$'
