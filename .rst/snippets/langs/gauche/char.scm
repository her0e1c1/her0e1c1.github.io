

;; ; (list->string (to #\あ #\ん))
;; ; (char-set->list #[a-z])
;; ; (char-set->list #[あ-ん])

;; ; #[^a-b]
;; ; (char-set-complement #[a-b])


(ps "char")
;; ; #\一文字 はchar
;; ; #\x数字 は、１６進数
(runs (char=? #\x #\a))


(pw "結果違う")
(runs (list->string (quote (#\a #\b))))
(runs (x->string (quote (#\a #\b))))
