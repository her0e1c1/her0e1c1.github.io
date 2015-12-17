#include <stdio.h>

#define LEFT_CHILD(i)  (((i) + 1) * 2 - 1)
#define RIGHT_CHILD(i) (((i) + 1) * 2)
#define PARENT(i)      (((i) + 1) / 2 - 1)

static inline void
swap(double arr[], int a, int b)
{
  double tmp = arr[a];
  arr[a] = arr[b];
  arr[b] = tmp;
}

void p(double a[], int len){
  for(int i = 0; i < len; i++){
    printf("%d, ", (int)a[i]);
  }
  printf("\n");
}


static void
upheap(double arr[], int n)
{
  while (n > 0) {
    int m = PARENT(n);
 
    if (arr[m] < arr[n]) {
      swap(arr, m, n);
    } else {
      break;
    }
 
    n = m;
  }
}

static void
downheap(double arr[], int n){
  int parent = 0;
  int tmp = 0;

  for(;;){
    int left = LEFT_CHILD(parent);
    int right = RIGHT_CHILD(parent);
    
    // 右の子供の存在有無によらず
    // 左側に子供がいることの必要条件 (arrにアクセスしてよいindexとなる)
    if (left >= n)
      break;

    if (arr[left] > arr[parent])
      tmp = left;

    // 左側の交換をしている場合があるので、ここでbreakはしない
    if (right < n && arr[right] > arr[parent])
      tmp = right;

    // どちらも入れ替えなかった場合に限りbreak
    if (tmp == parent)
      break;

    // 左の子供と親を入れ替えた後、さらに元左子供と右子供を入れ替えることはしない
    // 「子供のうち大きい方を親と入れ替える」と考える
    // つまりswapは一回でよい
    swap(arr, parent, tmp);
    parent = tmp;

  }
}

void
heapsort(double arr[], int n_elems)
{
  int i = 0;
  // 配列をヒープ構造にする
  while (++i < n_elems) {
    upheap(arr, i);
  }

  while(--i > 0){
    swap(arr, 0, i);
    downheap(arr, i);
  }
}

int main(){
  double a[] = {5, 3, 1, 2, 4};
  int n = 5;
  p(a, n);
  heapsort(a, n);
  p(a, n);
}