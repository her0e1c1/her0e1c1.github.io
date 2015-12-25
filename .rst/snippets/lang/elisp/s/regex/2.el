
; match-* returns number depending on evaluating the last string-match etc
(string-match "\\w+ \\w+" "test test")
(match-beginning 0)  ; 0
(match-end 0)  ; 9

; the last arg is number at which point the string starts to match
(string-match "\\w+ \\w+" "test test" 5)  ; nil

; check if current point matches regex
(looking-at "^; check if")


(s-match "\\w+ is" "this is a text.")