#include <stdio.h>
#include <stdlib.h>

#define MAX_NODE_NUM 1000
#define PARENT(i) (((i - 1) / 2))
#define LEFT(i) (2 * (i) + 1)
#define RIGHT(i) (2 * (i) + 2)
#define VALUE(h, i) (((Heap*) (h))->node[(i)])

// heap sort with object oriented
// C言語の場合、第一引数に構造体を指定することで、オブジェクト指向のように記述できる

typedef int Cell;

typedef struct {
  int n_nodes;  // 現在のnode数、また、次の配列に挿入するindex
  Cell node[MAX_NODE_NUM];
} Heap;

// inlineできない場合あり？
void swap(Heap* h, int i, int j){
  Cell tmp = h->node[i];
  h->node[i] = h->node[j];
  h->node[j] = tmp;
}

int compare(Cell c1, Cell c2){
  return c1 == c2 ? 0 : (c1 > c2 ? 1 : -1);
}

// Insert
void upheap(Heap* h, Cell c){
  int parent, child;
  h->node[h->n_nodes] = c;
  for(child = h->n_nodes;
      (parent = PARENT(child)) >= 0 &&  // 親が存在すること
      compare(VALUE(h, child), VALUE(h, parent)) == 1;  // 子が親より大きい
      child = parent){
    swap(h, parent, child);
  }
  h->n_nodes++;
}

// 大きい方の子供を返す。該当しない場合は0(rootは子供とならないので問題ない)
int maxChild(Heap* h, int parent){
  int left, right;
  if ((left = LEFT(parent)) >= h->n_nodes)  // 左右両方存在しない
    return 0;
  else if ((right = RIGHT(parent)) == h->n_nodes) // 右側が存在しないので左側が確定
    return left;
  else if (compare(VALUE(h, left), VALUE(h, right)) == 1)  // 両方存在するので比較
    return left;
  else
    return right;
}

// rootからheapを再構築
// max heap? (root is the larget number)
void downheap(Heap* h){
  int child;
  for(int parent = 0;
      (child = maxChild(h, parent)) > 0 &&
      compare(VALUE(h, child), VALUE(h, parent)) == 1;
      parent = child){
    swap(h, parent, child);
  }
}

void print(Heap* h){
  for (int i = 0; i < h->n_nodes; i++)
    printf("%d,", VALUE(h, i));
  printf("(len = %d)", h->n_nodes);
  printf("\n");
}

void printArray(Cell c[], int len){
  for (int i = 0; i < len; i++)
    printf("%d,", c[i]);
  printf("\n");
}

Cell* myHeapsort(Heap* h){
  while((h->n_nodes--) > 0){
    swap(h, 0, h->n_nodes);  // 最大値を末尾に入れ替える
    downheap(h);
  }
  return h->node;
}

Heap new(Cell a[], int n){
  Heap h;
  h.n_nodes = 0;
  for(int i = 0; i < n; i++){
    upheap(&h, a[i]);
  }
  return h;
}

int main(){
  Cell a[] = {3, 1, 2, 5, 4};
  int n = 5;
  printArray(a, n);
  Heap h = new(a, n);
  print(&h);
  Cell* b = myHeapsort(&h);
  printArray(b, n);
}
