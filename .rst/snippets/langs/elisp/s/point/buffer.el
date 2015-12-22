; pointはscriptから実行しても意味がない
; どのようにすれば分かりやすく簡単に実行できるか考える

; 現在のカーソルの位置
; point-min <= point <= point-max
(point)

; bufferの最小point
; 大抵は1(ほかを知らない)
(point-min)

; bufferの最大point
(point-max)

; カーソルが位置していればt
(bobp)  ; beginning of buffer 
(eobp)  ; end of buffer