
(perl "mkdir('./lockdir', 0755)")
(gosh (sys-mkdir "test.tmp" 777))

(p "mkdir -p PATH")
(gosh (make-directory* "/tmp/a/b/c"))
