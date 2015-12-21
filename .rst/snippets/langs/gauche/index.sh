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

$(goshe '(for-each (^x (ignore (print (sphinx-include-scm-list (list x))))) (glob "./s/*.scm"))')

EOS
