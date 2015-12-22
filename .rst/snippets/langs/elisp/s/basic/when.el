;tag: anaforic

; Eval a condition and if it's true, bind the value to a 'it' variable
(--when-let (+ 1 2 3) (* it it))  ; 36
(--when-let nil (* it it))  ; nil