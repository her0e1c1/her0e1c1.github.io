cd $(dirname $0) > /dev/null && cat <<EOS

==========
 Snippets
==========

Languages
=========

$(goshe '(print (sphinx-toctree-directory "langs"))'

Algorithm
=========

.. toctree::
   :maxdepth: 1 

   ./algo/index

$(goshe '(p (sphinx-section "misc" :up #t))')
$(goshe '(p (sphinx-toctree :path "misc/index.rst" :maxdepth 1))')

EOS
