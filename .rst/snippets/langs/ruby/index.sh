cd $(dirname $0) > /dev/null && cat <<EOS

======
 Ruby
======

.. contents::

$(go 'index.scm')

class
=====

$(goshe '(p (sphinx-run-path-ruby "class.rb"))')

EOS
