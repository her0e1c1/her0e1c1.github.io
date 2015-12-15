cd $(dirname $0) && cat <<EOS

==========
C Language
==========

(go "$HERE/index.scm")
$(goshe '(p (sphinx-toctree :glob "ce/*"))')

EOS

