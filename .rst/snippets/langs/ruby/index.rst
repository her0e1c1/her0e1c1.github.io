/usr/home/me/github/her0e1c1.github.io/.rst/snippets/langs/ruby
class.rb
index.rst
index.scm
index.sh

======
 Ruby
======

.. contents::



exit
====


.. code-block:: sh
   

    ruby -e 'exit'
    


.. code-block:: sh
   

    ruby -e 'exit!'
    


.. code-block:: sh
   

    ruby -e 'exec "echo 1"; p "NOT PRINTED"'
    1
    


.. code-block:: sh
   

    ruby -e 'p ENV["USER"].split(":")'
    ["me"]
    


.. code-block:: sh
   

    ruby -e 'p [false, nil].all?'
    false
    


.. code-block:: sh
   

    ruby -e 'def add(a: 1, b: 2) a+b end; puts add a: 3'
    5
    


.. code-block:: sh
   

    ruby -e 'def add(a=1, b=2) a+b end; puts add (a=3)'
    5
    


.. code-block:: sh
   

    ruby -e 'def add(*args) args.inject{|acc, it| acc+it} end; puts (add 1, 2, 3)'
    6
    


.. code-block:: sh
   

    ruby -e 'p true ? "ok" : "no"'
    "ok"
    



struct
======


.. code-block:: sh
   

    ruby -e 'F=Struct.new("F","a","b"); f=F.new(1, 2); p f.a'
    1
    


.. code-block:: sh
   

    ruby -e 'F=Struct.new("F","a","b"); f=F.new(1, 2); p f.b'
    2
    

class
=====


.. code-block:: rb
   

    class Human
      def initialize(name="")
        @name = name
      end
      attr_accessor :name
    end
    
    puts (Human.new "Bob").name
    
 
class.rb => 
::

    Bob
    

