
=============
 Sphinx Tips
=============

.. contents::

..
   文章構成
   =========

   - 固定は二重線?
   - 可変は一重線?

   1. ファイル名(固定)
   2. 第1区分(大まかな分岐, 固定)
   3. 第2区分(ある規則名をつけたタイトル, 可変)
   4. タイトルの内容を章ごとに(第2区分を読みやすく分ける, 固定)
   5. 章の中でもさらに説明が必要なもの(詳細, 可変)
   6. さらに説明を加える場合(atom)(可変)

   :ルール:
   エラーのダンプなど長いものはincludeディレクトリ以下にいれる.
   (ファイルを見やすくするため)

   ファイル名が第1の見出しとする

..
   一つのファイルで収める時の記述::

       -- ファイルの先頭に記述
       .. contents::
           :depth: N

      -- より詳しい説明が必要なものに対してはlocalを使う
      .. contents::
           :local:

   .. contents::
       :depth: N

   .. contents::
       :local:

Link
====

footer
------
::

  [#NAME]_  # Don't forget to use an underscore

  .. [#NAME] this is a text.

Internal link
-------------

You can link some words to a section in the same rst file. ::

 `Internal link`_  # if there are spaces, quote words

 Internal link
 -------------

Here is the `Internal link`_.

..
   見出しに対してリンクをはる
   --------------------------
   一ワードの見出しについて ::

       見出し
       ======

   と見出しを記述していくと思いますが, この見出しに対して内部リンクを
   はる場合には, ``見出し_`` と文字の最後にアンダースコアをつけます.

   複数文字について ::

       見出し 見出し
       -------------

   となりますが, ```見出し 見出し`_`` とバッククオートで囲めば, 空文字が
   入っていても問題ありません. 

.. _external:

external link
-------------
::

   This is `a google link`_.
   .. _a google link: http://google.com

This is `a google link`_.
.. _a google link: http://google.com

External link
-------------
::

   .. _external:

   External link
   -------------

Refer the link. ::

   :ref:`external`
   :ref:`Another section name displayed (This need not to be the same rst file) <external>`

Here is the :ref:`external`.

Href
----
refer aother site url ::

 `URL <http://test.com/index.html>`_

contents
--------
見出し ::

 .. contents::

.. contents::

toctree
-------

sphinxのリンクを作成する ::

 toctree::
 :maxdepth: 2
 :glob:

 dir/*

Import a file
=============
image
-----
::

 .. image:: path.img

file
----
::

 .. include:: ./test.c


source code
-----------
::

 .. literalinclude:: ./test.py
    :language: python
    :pyobject: Timer.start
    :lines: 1,3,5-10, 20-

In Line
=======
inline ::

   **emphasize strongly**
   *emphasize*
   ``source code``

List
====
list::

 *  リスト
 1. 手動ナンバリング
 #. 自動ナンバリング

リストのあとに文章 ::

 * list1 ::

    start

 #list1のi番目から始める必要があります。？

 一般的
 * list1

   * list2
   * list3

 #4 patterns
 * aaa
  * bbb

 * aaa

  * bbb

 * aaa
   * bbb

 * aaa

   * bbb

 #. aaa

   * bbb

 #. aaa

   * bbb

  #これのみ正しく解釈されます。
 #. aaa

    * bbb

 #. aaa

    * bbb

Option List
-----------
Here are samples about option list.

::

   -f FILENAME
      This is a sentence.

-f FILENAME
   This is a sentence.

::

   -d 
      no argument

-d 
    no argument

::

   --option value
     option needs value

--option value
  option needs value

::

   --This-is-a-long-option value
     take a long option. and set it to value

--This-is-a-long-option value
  take a long option. and set it to value

::

   -d
     first
     second (but this is one line)

-d
     first
     second (but this is one line)

::

   -b
      first line

      the other descriptions

-b
    first line

    the other descriptions

::

   -a WRONG! you need more than one line
   
-a WRONG! you need more than one line

Table
=====

one to one table
----------------

  :Date: 2000/01/01
  :Name: I am a boy
  :File: file.py

:Date: 2000/01/01
:Name: I am a boy
:File: file.py

one to many table
-----------------
::

   :class 1:
      - aaa
      - bbb
      - ccc
   :class 2:
      - xxx
      - yyy
      - zzz

:class 1:
    - aaa
    - bbb
    - ccc
:class 2:
    - xxx
    - yyy
    - zzz

csv table
---------
::

    .. csv-table:: table_name
        :header-rows: 1
        :widths: 1 4
        :stub-columns: 0
        :delim: ,

        name, dircotry
        Bob, /user/bob
        Tom, /user/tom

.. csv-table:: table_name
    :header-rows: 1
    :widths: 1 4
    :stub-columns: 0
    :delim: ,

    name, dircotry
    Bob, /user/bob
    Tom, /user/tom

vertical list table
-------------------
::

    .. list-table:: LIST NAME
        :header-rows: 1
        :widths: 20 30

      * - h1
        - h2

      * - r1
        - r2

.. list-table:: LIST NAME
    :header-rows: 1
    :widths: 20 30

    * - h1
      - h2

    * - r1
      - r2

horizontal list table
---------------------
::

  .. hlist::
     :columns: 3

     * item1
     * item2
     * item3

.. hlist::
    :columns: 3

    * item1
    * item2
    * item3

Block
=====

Highlight source code ::

 .. code-block:: python

    print("hello world")

.. code-block:: python

  print("hello world")

doctest blocks
--------------

Just one line code ::

    >>> 10
    1024

>>> 10
1024

multi lines code ::

    >>> print "hello," 
    hello,
    >>> print "world!"
    world!

>>> print "hello," 
hello,
>>> print "world!"
world!

Quoted Literal Blocks
---------------------

インデントを使わずに記号を使って記述する場合 ::

    これはインデントの代わりに使うテスト::

    > 1
    > 2
    > 3

これはインデントの代わりに使うテスト::

> 1
> 2
> 3

コード用Link
============

クラスの記述::

 .. module:: filename
 .. class:: name
 .. attribute:: name.attr
 .. method:: name.meth
 .. classmethod:: name.meth
 .. staticmethod:: name.meth

関数::

 .. method:: func(arg1, arg2)

  :param arg1: aaa
  :param arg1: bbb
  :rtype: return value

参照 ::

 :mod:`filename`
 :class:`name`

そのほか
========

Todo List
---------

 conf.pyに
 extensions = ['sphinx.ext.todo' ]
 todo_include_todos=True
 記述

 リストを書く
 .. todo:: ブロック図を書く

 todoをまとめて表示
 .. todolist::

docstringを全てhtmlで読みたい
-----------------------------
::

    sphinx-apidoc -F -o ./docs/ /path/to/python-module
    cd ./docs && make html

:依存モジュール:
* pygments -- python用のコードハイライト
* jinja2 -- htmlへのレンダリング
* docutils -- ファイル変換

