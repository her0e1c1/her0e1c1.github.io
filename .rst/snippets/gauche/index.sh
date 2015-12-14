HERE=$(dirname $0)
cat <<EOS
=============
 Gauche To C
=============

$(gosh -l ~/lib/scheme/init.scm <<EOG
EOG
)

.. toctree::

   gauche2c/index

EOS
