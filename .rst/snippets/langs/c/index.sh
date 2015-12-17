cd $(dirname $0) > /dev/null 2>&1 && cat <<EOS

==========
C Language
==========

$(goshe '(p (sphinx-toctree :glob "ce/*"))')
$(goshe '
 (let ((f (^x
          (let1 it (join-line (list (sphinx-section x :up #t) (sphinx-contents :depth 2)))
           (print (sphinx-include-scm-list (sort (glob #"./s/~|x|/*.scm")) #"~|x|.rst" :header it))))))
 (f "array")
 (f "string")
 (f "misc")
 )
')

EOS

### MEMO
# make -m /usr/home/mbp/GDrive/repos/freebsd.git/share/mk/ 
# rgv[0][0]=='-' ログインシェルと後に起動したシェルの見分け方はps -f。最初にハイフン「-」がついているシェルがログインシェルのプロセス。
