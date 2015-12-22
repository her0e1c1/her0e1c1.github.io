cd $(dirname $0) > /dev/null && cat <<EOS

======
 Ruby
======

.. contents::

$(go 'index.scm')

$(goshe '(sphinx-import-each-directory "s")')

class
=====

$(goshe '(p (sphinx-run-path-ruby "class.rb"))')

EOS
