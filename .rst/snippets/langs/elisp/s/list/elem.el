(-contains? '(1 2 3) 1)  ; t
(-contains? '(1 2 3) 0)  ; nil

; マッチした要素以降を返す
(member 'd '(b c d e f))  ; (d e f)
(member 'a '(b c d e f))  ; nil