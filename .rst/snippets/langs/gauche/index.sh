cd $(dirname $0) > /dev/null && cat <<EOS
========
 Gauche 
========

emacs
-----
1. 起動 ``M-x run-scheme``
2. ファイルを読み込む ``C-c C-l``
3. ``M-x package-install scheme-complete``
4. scheme-smart-complete

$(go <<EOG
EOG
)

$(goshe '(sphinx-import-each-directory "s")')

.. toctree::

   gauche2c/index

EOS
