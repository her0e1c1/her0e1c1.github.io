
(run "python -c 'print(\"hello world\")'")
;; ghc -e 'print "hello world"'

(node "\"hello world\"")
(sh "echo \"hello world\"")

(gosh (define (main args) (print "hello world!")))
