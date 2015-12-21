

;; (regexp-replace     #/(.)bc/ "abcAbc" "\\1-\\0")  ; "a-abcAbc"
;; (regexp-replace-all #/(.)bc/ "abcAbc" "\\1-\\0")  ; "a-abcA-Abc"

;; ; マッチした文字列をバインド
;; (rxmatch-let (rxmatch #/(\d+):(\d+):(\d+)/
;;                       "Jan  1 23:59:58, 2001")
;;              (time hh mm ss)
;;              (list time hh mm ss))
;; ; ("23:59:58" "23" "59" "58")

;; ; マッチしなかったら場合の初期値指定
;; (rxmatch-if (rxmatch #/(\d+:\d+)/ "Jan 1 11:22:33")
;;             (time)
;;             (format #f #"time is ~time")
;;             "unknown time")
;; ; "time is 11:22"



;; ; ((rxmatch) 1) ; => aに束縛とかよさげ?
;; ; #"~a~b"
;; ; (#/REGEX/ "strng")
