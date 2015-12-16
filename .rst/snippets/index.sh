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

C Language
==========

.. toctree::
   :maxdepth: 1 

   ./c/index
   ./exp/index

misc
====

.. toctree::
   :maxdepth: 1 
   :glob:

   ./oneliner/1
   ./parser/index
   ./fp/cps/index
   ./sphinx/index

EOS
