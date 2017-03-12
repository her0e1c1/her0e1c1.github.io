
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
- in place
- 計算量はO(NlogN)であるが、quicksortに比べて、heapを構築する作業がある分、2倍程度遅いが最悪計算量もO(NlogN)と変わらず

.. warning::
   上記の性質上、どちらかに値が偏ることがある.
   (``[5, 4, 1, 3, 2, 0]`` はheap構造であるが、一方に偏っている)

priority query
--------------
2分ヒープを使って実装できる.

:参照: O(1)
:削除: O(logN)
:追加: O(logN)

子からみた親のindexは?
----------------------
Cの場合0始まりとする.

子供をnとすると、もう一方の子供はn+1

たとえば、 1と2の時は、0になることを考えると、 ::

    PARENT = (CHILD - 1) / 2

0はルートなので親がいないようにマイナスとなる。 ::

  PARENT = (CHILD + 1) / 2 - 1 が成立するので
  PARENT + 1 = (CHILD + 1) / 2 = CHILD/2 + 1/2 = CHILD/2 (if CHILD is even)
  PARENT + 1 = (CHILD + 1) / 2 (if CHILD is odd)
  よって２通りの親の表し方ができる
  CHILD = 2(PARENT + 1)
  CHILD = 2(PARENT + 1) - 1

参考文献
========
- http://www.maroontress.com/Heap/heap-realization.pdf

```
parent >=0 $in N
S.T. parent = $lfloor $frac{child-1}{2} $rfloor ($Rightarrow child $ne 0)

left  &=& 2 $times parent + 1
right &=& 2 $times parent + 2

size &<=& left & $Rightarrow & $mbox{no children}
size &==& right = (left+1)& $Rightarrow & $mbox{only left child}
&& else & $Rightarrow & $mbox{two children}

downHeap(parent, A) &=& downHeap(maxChild, swap(A,maxChild, parent)) & (*maxChild > *parent $bigwedge maxChild > 0)
upHeap(child, A) &=& upHeap(parent, swap(A,child, parent)) & (*child > *parent and child > 0)
heapify(i, A) &=& heapify(i+1, upHeap(i, A)) & (任意の配列を0から順番にheapを構築)
sort(i, A) &=& sort(i-1, downHeap(0, swap(A, 0, i))) & (配列の末尾から昇順にソート)
```
