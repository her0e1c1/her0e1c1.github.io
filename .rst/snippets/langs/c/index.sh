cd $(dirname $0) > /dev/null 2>&1 && cat <<EOS

==========
C Language
==========

$(goshe '(p (sphinx-toctree :glob "ce/*"))')
$(goshe '(load-from-current-dirctory "index.scm")')

EOS

