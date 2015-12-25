
; r"^\^\[0-9\]\+\.(.+)"
(setq r "^[0-9]+.(ANYTHING)")
(string-match "^\\^\\[0\\-9\\]\\+\\.\\(.+\\)" r)
(match-string 1 r)  ; ANYTHING


; r"(\w+) (\w+)"
(setq r "first second")
(string-match "\\(\\w+\\) \\(\\w+\\)" r)
(match-string 1 r)  ; first
(match-string 2 r)  ; second
(match-string 3 r)  ; nil