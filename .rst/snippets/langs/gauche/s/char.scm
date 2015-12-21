(load-from-current-dirctory "include-gauche.scm")

(runs (list->string (to #\あ #\ん)))
(runs (char-set->list #[a-z]))
(runs (char-set->list #[あ-ん]))

(p "#[^a-b]")
(runs (char-set-complement #[a-b]))

(ps "char")
(p "#\\一文字 はchar")
(runs (char=? #\x #\a))

(pw "結果違う")
(runs (list->string (quote (#\a #\b))))
(runs (x->string (quote (#\a #\b))))

;; ; #\x数字 は、１６進数
