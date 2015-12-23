(load-from-current-dirctory "include-sh.scm")

;; for i in *.csv; do a=$i; mv $a ${i/\.csv/.txt};done

;; filepath=/home/usr/test.txt
;; # ##は、最長マッチした部分を除外
;; # base=$${filepath##*/}
;; base=${filepath##*/}
;; # text.txt

;; # you remove matching min string at the right side
;; parent=${filepath%/*}
;; # /home/usr

;; echo "path $filepath"
;; echo "dir ${filepath%/*}"
;; echo "base ${filepath##*/}"

;; # N
;; # - Follow symbolink
;; # / Match directory 
;; # . Match file
;; echo /bin(N-/)  # /bin
;; echo /bin/sh(/)  #
;; echo /bin/sh(.)  # /bin/sh
