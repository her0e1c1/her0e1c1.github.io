cd $(dirname $0) > /dev/null 2>&1 && cat <<EOS

====
Perl
====

$(goshe '(sphinx-import-each-directory "s")')

EOS
