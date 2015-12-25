;tag: anaforic

; Eval a condition and if it's true, bind the value to a 'it' variable
(--if-let (+ 1 2 3) it 1)  ; 6
(--if-let nil it 1)  ; 1