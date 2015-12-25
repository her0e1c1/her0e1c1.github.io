
; 一文字目を大文字に、残りは何もしない
(upcase-initials "abc aBc Abc")  ; "Abc ABc Abc"


; 一文字目を大文字に、残りは全て小文字にする
(capitalize "abc aBc Abc")  ; "Abc Abc Abc"