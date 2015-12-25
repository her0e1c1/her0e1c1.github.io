; 現在のカーソルが位置する行の位置
(point-at-bol)

(point-at-eol)

; カーソルが位置していればt
(bolp)  ; beginning of line
(eolp)  ; end of line


; lineとpointは区別
; return current line number
(line-number-at-pos)  ; == (line-number-at-pos (point))