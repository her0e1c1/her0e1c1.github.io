
======
 Perl
======

.. contents::


.. warning::

    Don't use double quote which extend $ in sh or escape it


.. code-block:: sh
   

    perl -e "$a=1; print $a"
    syntax error at -e line 1, near "="
    Execution of -e aborted due to compilation errors.
    


.. code-block:: sh
   

    perl -e "\$a=1; print \$a"
    1



options
=======

With -0 option delimiter is NULL
With -0777 you can't use any option delimiter.

.. code-block:: sh
   

    echo "a
    a
    a"|perl -p0777E 's/a/b/'
    b
    a
    a
    

Display warning

.. code-block:: sh
   

    perl -we 'print @a'
    Name "main::a" used only once: possible typo at -e line 1.
    



special characters
==================

$"
This is a "@array" delimiter

.. code-block:: sh
   

    perl -E '$" = " - "; @a=1..5; say "@a"'
    1 - 2 - 3 - 4 - 5
    

execute shell command. you need -i option

.. code-block:: sh
   

    perl -e 'system qq#sh -ic "ll /lib/libc.so.*"#'
    -r--r--r--  1 root  wheel  1567216  1月 17  2014 /lib/libc.so.7
    



escape quote in sh
==================


.. code-block:: sh
   

    perl -E 'say'\''HOGE HOGE'\'''
    HOGE HOGE
    


.. code-block:: sh
   

    perl -M'File::Basename' -E 'say basename qq#/path/to/text.txt#'
    text.txt
    


.. code-block:: sh
   

    perl -M'File::Spec' -E 'say File::Spec->catfile(q#/path/to#, q#text.txt#)'
    /path/to/text.txt
    

