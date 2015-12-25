
(zsh "a='hoge'; echo ${a/ho/HO}")
(ruby "a=%q/hoge/;p a.sub(/ho/, %q/HO/)")

(ps "regexp-replace")
(gosh (regexp-replace     #/(.)bc/ "abcAbc" "\\1-\\0"))
(gosh (regexp-replace-all #/(.)bc/ "abcAbc" "\\1-\\0"))
