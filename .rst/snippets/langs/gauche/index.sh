HERE=$(dirname $0)
cat <<EOS
========
 Gauche 
========

$(go <<EOG
EOG
)

.. toctree::

   gauche2c/index


EOS
