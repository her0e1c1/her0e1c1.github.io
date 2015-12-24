
;; # The decode method always returns Unicode.
;; # utf-8 => unicode
;; "あ".decode("utf-8")

;; # unicode => utf-8
;; u"あ".encode("utf-8")

;; # unicode => shift-jis
;; u"あ".encode("shift-jis")

;; # utf-8 => unicode => shift-jis
;; "あ".decode("utf-8").encode("shift-jis")

;; u"あ" == u"あ"  # True

;; # ipythonやcsvではFalseと評価されるので実行環境に気をつけること
;; u"あ" == "あ".decode("utf-8")  # True?
;; "あ" == u"あ".encode("utf-8")  # True?

;; # UnicodeWarning: Unicode equal comparison failed to convert both arguments to Unicode - interpreting them as being unequal
;; u"あ" == "あ"
