
(run "perl -le 'print unpack(\"H*\", $ARGV[0]);' 'あいうえお' ")
(run "perl -E 'say unpack(\"B*\", \"A\");'")


(gosh (format #t "~D ~B ~O ~X" 256 256 256 256))
(gosh (format #f "~b ~b" #b1101001 100))

(p "break line")
(gosh (format "~%"))

(ps "sprintf")
(p "Number to string")
(c "char b[32]; sprintf(b, \"%d\", 12345); p(\"%s\", b);")

(run "perl -E 'say sprintf(\"%s, %s\", \"hello\", \"world\")'")


(emacs (format "%s" "hoge"))

(emacs (format "%s %c %x %d" "abc" ?a 10 10))
(emacs (s-format "$0, $1" 'elt '("hello" "world")))
(emacs (s-format "${name}" 'aget '(("name" . "test"))))
(emacs (let ((h (ht-create))) (ht-set! h "key" "val") (s-format "${n}" 'gethash h)))
