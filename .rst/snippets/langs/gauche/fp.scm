

; matchした要素だけ取得
(filter #/^..$/ (glob "*"))


; f g => (f (g x))
(define not-zero? (compose not zero?))
(not-zero? 3)

; bに結果が溜まる
; s '(fold (^(a b) (cons a b)) ''() (i 10))'



; s '(filter ($ not $ even? $) (i 10))'
; s '(filter (.$ not even?) (i 10))'

; ((pa$ flip map) (iota 10) print)

; s '($ p $ + 1 2 3)' => 6
