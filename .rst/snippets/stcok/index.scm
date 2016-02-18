cd $(dirname $0) > /dev/null 2>&1 && cat <<EOS

=======
 Stock
=======

$(goshe '(sphinx-create-index-in-directory (glob "*")) ""')
$(goshe '(print (sphinx-toctree-directory. (glob "*")))')

EOS

