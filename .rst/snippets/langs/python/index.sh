cd $(dirname $0) > /dev/null 2>&1 && cat <<EOS

======
Python
======

$(goshe '(sphinx-import-each-directory "s")')

EOS
