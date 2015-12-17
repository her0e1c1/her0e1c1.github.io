cd $(dirname $0) > /dev/null 2>&1 && cat <<EOS

==========
C Language
==========

$(goshe '(sphinx-contents :depth 1)')
$(goshe '(p (sphinx-toctree :glob "ce/*"))')
$(goshe '(sphinx-include-scm-list (sort (glob "./s/*.scm")) "./s/index.rst")')

EOS

### MEMO
# make -m /usr/home/mbp/GDrive/repos/freebsd.git/share/mk/ 
# rgv[0][0]=='-' ログインシェルと後に起動したシェルの見分け方はps -f。最初にハイフン「-」がついているシェルがログインシェルのプロセス。

