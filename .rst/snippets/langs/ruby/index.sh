cd $(dirname $0) && cat <<EOS

======
 Ruby
======

.. contents::

$(go 'index.scm')

class
=====

$(goshe '(p (sphinx-run-path-ruby "class.rb"))')

EOS
