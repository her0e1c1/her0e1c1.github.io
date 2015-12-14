HERE=$(dirname $0)
cat <<EOS
=============
 Gauche To C
=============

$(gosh -l ~/lib/scheme/init.scm <<EOG
 (current-directory "$HERE")
 (let* ((src "FizzBuzz.scm")
        (dst "FizzBuzz.c")
        (trn "translate.scm")
        (cmd #"gosh ~trn -i ~src -o ~dst")
        (_ (sys-system cmd))
        (cmd-block (sphinx-block cmd :block #t))
        (src-block (sphinx-block-path src))
        (dst-block (sphinx-block (file->string dst) :code-block "c"))
        (trn-block (sphinx-block (file->string trn) :code-block "scheme"))
        (result (sphinx-block (run-c dst) :block #t))
        )
   (print #"
using CiSE
==========
~cmd-block ~src-block ~trn-block
Generate C
==========
The comand creates a translated .c file.
~dst-block
So you can run it.
~result
"))
EOG
)

EOS
