

;; # Read man zshexpan

;; data='a
;; b
;; c
;; d'
;; # split \n
;; echo ${(f)data}  # a b c d
;; echo $#data  # 7
;; echo ${(qf)data}  # a b c d
;; echo ${(qqf)data}  # 'a' 'b' 'c' 'd'
;; echo ${(qqqf)data}  # "a" "b" "c" "d"
;; echo ${(qqqqf)data}  # $'a' $'b' $'c' $'d'

;; # join ,
;; echo ${(j:,:)${(f)data}}  # a,b,c,d
;; # split ,
;; echo ${(s:,:)${(f)data}}  # a b c d

;; a="aaabc"
;; # この正規表現はa*と同じ意味で、マッチした文字を取り除く
;; echo ${a##a##}

;; # 変数代入
;; : ${a::=1}
;; echo "{1..10} =" {1..10}



;; echo $(echo ~)(:a)  # /home/USER
;; echo $(echo ~/.emacs.d)(:A)  # expand symbol link
