(load-from-current-dirctory "include-sh.scm")

;; #VARS1=($$ $0 $1 $2)
;; VARS1=(a b c d e)

;; # Don't insert spaces around = operator
;; #VARS1 = (a b c d e)

;; arr1=(1 2 3 4 5)

;; # Access index i of an array
;; echo "arr1[1] =" ${arr1[1]}

;; # You can't use (), which is an error
;; # for i in (1 2 3);do echo $i; done

;; # Multi liners
;; for i in ${VARS1[@]}; do
;;     echo $i;
;; done

;; # Make associativ array named y
;; typeset -A y
;; y=(a 1 b 2 c 3)
;; echo $y  # 1 2 3
;; echo ${(@kv)y}  # a 1 b 2 c 3
;; echo ${(@k)y}  # a b c
;; echo ${(@v)y}  # 1 2 3
;; echo ${(@M)y}  # 1 2 3
;; echo $y[a]  # 1
;; echo ${${(@M)y}[1]}  # 1

;; typeset -a unique_list
;; unique_list=(1 2 3 4 1 2)
;; typeset -U unique_list
;; echo $unique_list  # 1 2 3 4
