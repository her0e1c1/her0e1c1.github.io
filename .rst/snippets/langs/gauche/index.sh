cd $(dirname $0) > /dev/null && cat <<EOS
========
 Gauche 
========

$(go <<EOG
EOG
)

.. toctree::

   gauche2c/index

$(go "index.scm")

EOS
