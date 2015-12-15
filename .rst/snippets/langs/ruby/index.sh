cd $(dirname $0) && cat <<EOS

======
 Ruby
======

$(go 'index.scm')
$(goshe '(p (sphinx-run-path-ruby "class.rb"))')

EOS
