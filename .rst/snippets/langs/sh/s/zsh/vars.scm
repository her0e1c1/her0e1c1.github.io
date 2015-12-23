;; # split \n
;; data='a
;; b
;; c
;; d'
;; echo ${(f)data}  # a b c d
;; echo $#data  # 7
;; echo ${(qf)data}  # a b c d
;; echo ${(qqf)data}  # 'a' 'b' 'c' 'd'
;; echo ${(qqqf)data}  # "a" "b" "c" "d"
;; echo ${(qqqqf)data}  # $'a' $'b' $'c' $'d'

;; # join ,
;; echo ${(j:,:)${(f)data}}  # a,b,c,d

;; a="aaabc"
;; # この正規表現はa*と同じ意味で、マッチした文字を取り除く
;; echo ${a##a##}
