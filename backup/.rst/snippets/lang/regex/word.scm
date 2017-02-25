

;; import re
;; # python2
;; # warn: \wは日本語といった文字列にはマッチしない
;; assert not re.match(r'\w', u"あ")
;; # そのため、UNICODEのフラグを設定する
;; assert re.match(r'\w', "あ", re.UNICODE)
;; assert re.match(r'\w', u"あ", re.UNICODE)
;; assert re.match(ur'\w', "あ", re.UNICODE)
;; assert re.match(ur'\w', u"あ", re.UNICODE)
;; # warn: \wは（などの全角の括弧にもマッチしない
;; assert not re.match(r'\w', u"（", re.UNICODE)
