
#include <myc.h>

#define PARENT(n) (((n) - 1) / 2)
#define LEFT(n) (2 * (n) + 1)
#define RIGHT(n) (2 * (n) + 2)
#define VALUE(h, n) ((h)->array[(n)])
#define data_type int

static inline void swap(data_type *a, int i, int j) {data_type t=a[i];a[i]=a[j];a[j]=t;}

// return a child index which is more than 0
// 数直線をイメージする
// --- size --- left --- right ---
// size <= leftなら、子供なし

// MEMO:
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

// MEMO:
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

// MEMO:
data_type *heapSort(data_type *array, int size) {
  for (int i = 0; i < size; i++)
    upHeap(array, i);
  for (int i = size - 1; i >= 0; i--) {
    // swapではiは有効, downHeapではiは無効
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
