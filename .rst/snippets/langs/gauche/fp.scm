

; matchした要素だけ取得
(filter #/^..$/ (glob "*"))


; f g => (f (g x))
(define not-zero? (compose not zero?))
(not-zero? 3)
