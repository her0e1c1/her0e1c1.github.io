
===========
 Heap sort
===========

.. contents::

Introduction
============

頭からヒープ構造を構築し、その過程でソートする
作成したヒープ構造は、その末尾から配列に戻す作業を行う
配列 => ヒープ => 配列と構造を変化させる
heap構造とは、2分木のデータ構造で、子よりも親の方が大きい(あるいは小さい)データ構造

特徴
====
- ルートが最大(または最小)となる.
- 各親は、必ず子供よりも大きい(あるいは、小さい)
- 適したデータコンテナは、リストではなく配列

.. warning::
   上記の性質上、どちらかに値が偏ることがある.
   (``[5, 4, 1, 3, 2, 0]`` はheap構造であるが、一方に偏っている)

priority query
--------------
2分ヒープを使って実装できる.

:参照: O(1)
:削除: O(logN)
:追加: O(logN)

to do
=====
- メモリを動的に確保したアルゴリズム

question
========

- `子からみた親のindexは?`_
- なぜ親はfloor(n/2)で表現できるのか？
- `N(nlogn)であることの説明`_
- upheapを再帰で実装できるか？


子からみた親のindexは?
----------------------
Cの場合0始まりとする.

子供をnとすると、もう一方の子供はn+1

たとえば、 1と2の時は、0になることを考えると、 ::

    PARENT = (CHILD - 1) / 2

0はルートなので親がいないようにマイナスとなる。

::

  PARENT = (CHILD + 1) / 2 - 1 が成立するので
  PARENT + 1 = (CHILD + 1) / 2 = CHILD/2 + 1/2 = CHILD/2 (if CHILD is even)
  PARENT + 1 = (CHILD + 1) / 2 (if CHILD is odd)
  よって２通りの親の表し方ができる
  CHILD = 2(PARENT + 1)
  CHILD = 2(PARENT + 1) - 1

実装例
======

. literalinclude:: heap_sort.c
   :language: c

. literalinclude:: heap_sort1.c
   :language: c

参考文献
========
 - http://www.maroontress.com/Heap/heap-realization.pdf