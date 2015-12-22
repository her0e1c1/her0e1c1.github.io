(load-from-current-dirctory "include-gauche.scm")

(ps "regexp-replace")
(runs (regexp-replace     #/(.)bc/ "abcAbc" "\\1-\\0"))
(runs (regexp-replace-all #/(.)bc/ "abcAbc" "\\1-\\0"))


(ps "rxmatch-let")
(p "マッチした文字列をバインド")
(runm #!HEREDOCUMENT EOS
(rxmatch-let (rxmatch #/(\d+):(\d+):(\d+)/
                      "Jan  1 23:59:58, 2001")
             (time hh mm ss)
             (list time hh mm ss))
EOS
)


(ps "rxmatch-if")
(p "マッチしなかったら場合の初期値指定")
(define t (template$ #!HEREDOCUMENT EOS
(rxmatch-if (rxmatch #/(\d+:\d+)/ "REPLACE")
            (time)
            (format #f #"time is ~time")
            "unknown time")
EOS
))
(runm (t "Jan 1 11:22:33"))
(runm (t "HOGE:HOGE"))


(ps "match")
(runs (#/str/ "strng"))
(runs ((#/str/ "strng") 0))
