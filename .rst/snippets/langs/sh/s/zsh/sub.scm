(load-from-current-dirctory "include-sh.scm")


;; for i in *.csv; do a=$i; mv $a ${i/\.csv/.txt};done

;; # zshの特殊表記
;; a="a b c"; for i in ${(s/ /)a}; do echo $i;done


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

;; echo "make a buckup file for $filepath"
;; echo $filepath{,.bak}


;; # Create files with combination. Make sure before you run the command above, echo it, echo {a,b,c}.{txt,csv}
;; touch {a,b,c}.{txt,csv}


;; # N
;; # - Follow symbolink
;; # / Match directory 
;; # . Match file
;; echo /bin(N-/)  # /bin
;; echo /bin/sh(/)  #
;; echo /bin/sh(.)  # /bin/sh

;; # if a variable is defiend, then return 1
;; echo ${+path}  # 1
;; echo ${+pathpath}  # 0
