(p "全て大文字")
(ghc "map Data.Char.toUpper \"abc aBc Abc\"")


(p "一文字目を大文字に、残りは何もしない")
(emacs (upcase-initials "abc aBc Abc"))


(p "一文字目を大文字に、残りは全て小文字にする")
(emacs (capitalize "abc aBc Abc"))
