
(run "perl -E 'qq/test/ =~ m#(?<=.*?)e#'"
     :warn "Variable length lookbehind not implemented in regex")
(run "perl -E 'q/abcde/ =~ /(?<=.*?c).*/; say $&'")

(run "perl -E 'q/abcde/ =~ /(.*?c)\K.*/; say $&'"
     :msg "You can subsutitute lookbind with \K option")

;; 後読み否定は、特定の文字列でマッチさせたいが、後方一致がまぎれないようにするときに使える
;; MAN_NUMBERとWOMAN_NUMBERで
;; (?<!WO)MAN_\d+
;; みたいな感じ
