HERE=$(dirname $0) && cat <<EOS
=====
 PHP
=====

::

  curl -O psysh.org/psysh && php psysh

::

   php -r 'echo "hello world";'

$(go "$HERE/index.scm")

EOS
