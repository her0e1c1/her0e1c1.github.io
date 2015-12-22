cd $(dirname $0) > /dev/null 2>&1 && cat <<EOS

============
Shell Script
============

$(goshe '(sphinx-import-each-directory "s")')

EOS

