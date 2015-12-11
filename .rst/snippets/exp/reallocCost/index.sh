HERE=$(dirname $0)
cat <<EOS

==============
 Realloc Cost
==============

$(gosh -l ~/lib/scheme/init.scm <<EOG
 (define (run path name pow arg)
   (let* ((r1 (get-time (lambda () (run-c path pow arg))))
          (r2 (cmd-c name pow arg))) 
     (sphinx-block #"# time => ~|r1|(sec)\n~|r2|" :block #t)))
 (let* ((name "reallocCost.c")
        (pow 5)
        ; (pow 24)
        (path (f-join "$HERE" name))
        (file (sphinx-block (file->string path) :code-block "c"))
        (cmd1 (run path name pow "ONE"))
        (cmd2 (run path name pow "EACH"))
        )
   (print #"~file ~cmd1 ~cmd2"))
EOG
)

EOS
