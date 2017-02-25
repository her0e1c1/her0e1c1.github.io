
(node "'ABCDEF'.match(/DEF/i)")
(node "'abc'.match(/a.c/)")

(gosh (#/str/ "strng"))
(gosh ((#/str/ "strng") 0))


(ps "rxmatch-let")
(p "マッチした文字列をバインド")
(gosh #!HEREDOCUMENT EOS
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
(gosh (t "Jan 1 11:22:33"))
(gosh (t "HOGE:HOGE"))

(emacs (string-match "\\w+ \\w+" "test test" 5)
       :msg "the last arg is number at which point the string starts to match")
