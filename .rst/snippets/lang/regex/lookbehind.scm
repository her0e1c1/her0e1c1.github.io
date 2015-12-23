
(run "perl -E 'qq/test/ =~ m#(?<=.*?)e#'"
     :warn "Variable length lookbehind not implemented in regex")
(run "perl -E 'q/abcde/ =~ /(?<=.*?c).*/; say $&'")

(run "perl -E 'q/abcde/ =~ /(.*?c)\K.*/; say $&'"
     :msg "You can subsutitute lookbind with \K option")
