(load-from-current-dirctory "include.scm")

(define run oneliner-run+)

(p "2の倍数")
(run "echo 124 | perl -nlE 'say if /\d*[24680]$/'")
(run "echo 123 | perl -nlE 'say if /\d*[24680]$/'")

(p "ConvertTabToTwoSpaces")
(run "perl -pE 's/\t/  /' s1.txt")

(p "Get basename")
(run "echo /path/to/base.txt |perl -nlE 's#(.*/)## and say'")

(p "Get dirname")
(p "echo /path/to/base.txt |perl -nlE 'm#(.*/)# and say $'")


(p "\2に'がマッチ、$4に'>がマッチ")
; (run "perl -E '$_=shift; s#(<a.*?href=([\"'']))(.*?)(\2.*?>)#$1$3/$4# and say' \"<a href='/path/to'>\"")

(p "greedy matching the last dot
 ~/.emacs.d/init.el => el")
(run "perl -E '$_=\"~/.emacs.d/init.el\"; s/.*[.](.*)$/$1/s; say'")

