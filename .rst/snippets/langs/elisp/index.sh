HERE=$(dirname $0)
cat <<EOS
============
 Emacs Lisp
============

$(go << EOS

 (p (sphinx-block (oneliner-elisp "\"Hello world!\"") :code-block "lisp"))

EOS
)


EOS
