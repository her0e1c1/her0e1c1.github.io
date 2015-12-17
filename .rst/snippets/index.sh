cd $(dirname $0) > /dev/null && cat <<EOS

==========
 Snippets
==========

Languages
=========

$(goshe '
  (-->
   ((flip$ filter-map) (ls "langs")
    (^x (and-let* ((_ (file-exists? #"~|x|/index.rst"))
                   (p #"~|x|/index"))
                  p)))
   (sort it)
   (sphinx-block (string-join it "\n") :toctree #t :maxdepth 1)
   (p it))
')

Algorithm
=========

.. toctree::
   :maxdepth: 1 

   ./algo/index
   ./struct/index

$(goshe '(p (sphinx-section "misc" :up #t))')
$(goshe '(p (sphinx-toctree :path "misc/index.rst" :maxdepth 1))')

EOS
