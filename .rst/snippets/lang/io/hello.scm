
(run "python -c 'print(\"hello world\")'")
(ghc "\"hello world\"")

(node "\"hello world\"")
(sh "echo \"hello world\"")

(gosh (define (main args) (print "hello world!")))

(emacs (message "hello"))
(emacs (message 1) :warn "TYPE ERROR")
(emacs (pp '("test" ("a" ("b") "c") (1 2 3))))
