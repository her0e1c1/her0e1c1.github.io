; buffer内の文字列取得（属性付き）
(buffer-string)
; 上記の表現は以下の範囲指定と同じ
(buffer-substring (point-min) (point-max))

; bufferの文字長取得
(length (buffer-string))

; buffer内の文字列取得
(buffer-substring-no-properties (point-min) (point-max))