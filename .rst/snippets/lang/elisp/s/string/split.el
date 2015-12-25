(split-string "a-b-c" "-")  ; ("a" "b" "c")
(split-string "-" "-")  ; ("" "")
(split-string "" "")  ; ("")

(s-split " " "a b c")  ; ("a" "b" "c")