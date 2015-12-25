(buffer-modified-p)

; 上記関数でtを返す場合であっても
; 強制的にnilにすることも可能
(set-buffer-modified-p nil)