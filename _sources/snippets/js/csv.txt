
============
 csv parser
============

.. raw:: html

    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
    <script type="text/javascript" src="../../static/js/csv.js"></script>
    <textarea id="input" rows="10" cols="50">
    A
    a, b,  c , d
    e,f, " g ,
    end" , h
    </textarea>
    <button onclick="runCsvParser()">Run</button>
    <div id="output"></div>
    <script src="csv.js"></script>


.. literalinclude:: ../../static/js/csv.js
   :language: js
