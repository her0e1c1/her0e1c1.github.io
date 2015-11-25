
============
 csv parser
============

.. contents::

DEMO
====

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

BNF
===

Refer http://www.ietf.org/rfc/rfc4180.txt

::
   
   file = [header CRLF] record *(CRLF record) [CRLF]
   header = name *(COMMA name)  ; same as record
   record = field *(COMMA field)
   name = field
   field = (escaped / non-escaped)
   escaped = DQUOTE *(TEXTDATA / COMMA / CR / LF / 2DQUOTE) DQUOTE
   non-escaped = *TEXTDATA
   COMMA = %x2C
   CR = %x0D
   DQUOTE =  %x22
   LF = %x0A
   CRLF = CR LF
   TEXTDATA =  %x20-21 / %x23-2B / %x2D-7E  ; except for " and ,

You can't distinguish header from record.
So you need an option to check if there is a header or not.

REGEX
=====


SAMPLE
======

.. literalinclude:: /sample/graph/parser/csv/csvParser.hs
   :language: haskell
