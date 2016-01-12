
(p"
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

")

(math "
parent >=0 $in N ($Rightarrow child $ne 0)
s.t. $quad parent = $lfloor $frac{child-1}{2} $rfloor

left  &=& 2 $times parent + 1
right &=& 2 $times parent + 2

size &<=& left & $Rightarrow & no children
size &==& right = (left+1)& $Rightarrow & only left child
&& else & $Rightarrow & two children

downHeap(parent, A) &=& downHeap(max_child, swap(A,max_child, parent)) & (*max_child > *parent and max_child > 0)
upHeap(child, A) &=& upHeap(parent, swap(A,child, parent)) & (*child > *parent and child > 0)
heapify(i, A) &=& heapify(i+1, upHeap(i, A)) & (任意の配列を0から順番にheapを構築)
sort(i, A) &=& sort(i-1, downHeap(0, swap(A, 0, i))) & (配列の末尾から昇順にソート)
")

(c #!Q
#include <myc.h>

#define PARENT(n) (((n) - 1) / 2)
#define LEFT(n) (2 * (n) + 1)
#define RIGHT(n) (2 * (n) + 2)
#define VALUE(h, n) ((h)->array[(n)])
#define data_type int

static inline void swap(data_type *a, int i, int j) {data_type t=a[i];a[i]=a[j];a[j]=t;}

// return a child index which is more than 0
data_type maxChild(data_type *a, int parent, int size) {
  int left, right;
  if ((left = LEFT(parent)) >= size)
    return 0;
  else if ((right = RIGHT(parent)) == size) {
    return left;
  } else if (a[left] < a[right])
    return right;
  else
    return left;
}
void downHeap(data_type *a, int size) {
  int parent = 0;
  while (1) {
    int child = maxChild(a, parent, size);
    if (child > 0 && a[parent] < a[child]) {
      swap(a, parent, child);
      parent = child;
    } else
      break;
  }
}
void upHeap(data_type *a, int child) {
  while (1) {
    int parent = PARENT(child);
    if (child > 0 && a[parent] < a[child]) {
      swap(a, parent, child);
      child = parent;
    } else
      break;
  }
}
data_type *heapSort(data_type *array, int size) {
  for (int i = 0; i < size; i++)
    upHeap(array, i);
  for (int i = size - 1; i >= 0; i--) {
    swap(array, 0, i);  // sort from last to first
    downHeap(array, i);
  }
  return array;
}
int main() {
  int a[] = {5, 3, 1, 2, 4};
  heapSort(a, SIZE(a));
  PVI(a);
}
Q :str #t)
