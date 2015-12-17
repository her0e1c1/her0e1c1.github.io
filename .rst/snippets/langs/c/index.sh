cd $(dirname $0) > /dev/null 2>&1 && cat <<EOS

==========
C Language
==========

$(goshe '(p (sphinx-toctree :glob "ce/*"))')
$(goshe '
 (join-line (list (sphinx-section "misc" :up #t) (sphinx-contents :depth 2)))
 (sphinx-include-scm-list (sort (glob "./s/*.scm")) "./s/index.rst" :header it)
')

EOS

### MEMO
# make -m /usr/home/mbp/GDrive/repos/freebsd.git/share/mk/ 
# rgv[0][0]=='-' ログインシェルと後に起動したシェルの見分け方はps -f。最初にハイフン「-」がついているシェルがログインシェルのプロセス。
