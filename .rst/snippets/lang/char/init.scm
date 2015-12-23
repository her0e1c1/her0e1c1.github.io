
(cpp "string s; s=char('A' + 1); P(s)")
(cpp "string s; s='A'+1; P(s)")
(cpp "string s='A'+1;" :warn "cannot declare with char")

;; ; #\x数字 は、１６進数
(gosh (list->string (to #\あ #\ん)))
(gosh (char-set->list #[a-z]))
(gosh (char-set->list #[あ-ん]))

(p "#[^a-b]")
(gosh (char-set-complement #[a-b]))

(ps "char")
(p "#\\一文字 はchar")
(gosh (char=? #\x #\a))

(pw "結果違う")
(gosh (list->string (quote (#\a #\b))))
(gosh (x->string (quote (#\a #\b))))
