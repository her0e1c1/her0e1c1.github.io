
(-zip '(1 2 3) '(4 5 6))

; 要素数が同じでない場合は、短いリストにあわせる
(-zip '(1) '(4 5 6))  ; ((1 . 4))