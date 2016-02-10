(define test1 "1, 4, 45, 3, 7, 6, 7, 7, 7, 10, 8, 8, 8, 8, 1, 10, -1, 3, 20, 5, 9, 33, -1, 4,5,3,6 ")
(define to-i (^x (map (^y (x->integer (string-trim-both y))) (string-split x ","))))

(p "再帰関数の呼び出しするときに、スタックに実引数を積む必要があるので、メモリスペースは、平均O(logN)必要")

(define code1 "
  int pivot = a[left];
  int k = left;
  // items from left+1 to k are smaller than pivot
  for (int i = left + 1; i <= right; i++)
    if (a[i] < pivot) swap(a, ++k, i);
  swap(a, left, k);
  // items from left to k-1 are smaller than pivot
  qsort(a, left, k-1);
  qsort(a, k+1, right);
")

(define code2 "
  int pivot = a[left];
  int k = left;
  // items from left to k-1 are smaller than pivot
  for (int i = left + 1; i <= right; i++) {
    if (a[i] < pivot) {
      swap(a, k, i);
      k++;
    }
  }
  // ここでのkはpivot<=a[k]となる(つまり、右側に含める必要あり)
  // k = left の場合if条件が一度も満たされないとk == leftのままなので
  // qsort(a, k, right)だと、無限ループに陥る
  // qsort(a, k+1, right)とする必要がある
  qsort(a, left, k-1);
  if (k == left)
    qsort(a, k+1, right);
  else
    qsort(a, k, right);
")
(define code3 "
  int pivot = a[left];
  int i = left, j = right;
  while (1) {
    while(a[i] < pivot) i++;
    while(a[j] > pivot) j--;
    if (i <= j){
      swap(a, i, j); i++; j--;
    } else
      break;
  }
  // 無限ループにならないよう、必ず、2つに分割される必要がある
  // left ~ j (pivot以下)
  // i ~ right (pivot以上)
  qsort(a, left, j);
  qsort(a, i, right);
")
(define code3-1 "
  int pivot = a[left];
  int i = left, j = right;
  while (1) {
    while(a[i] < pivot) i++;  // ガード文と見るのがポイント!
    while(a[j] > pivot) j--;
    if (i <= j){
      // i-1番目までは、a[i]<pivotを満たす
      // i番目は、a[j](<=pivot)とswapすることで、
      // leftからi番目までが必ずpivot以下となる.
      swap(a, i, j); i++; j--;

      // （間違い）配列のそれぞれ一つ前は逆条件を満たす?
      // a[left ~ (i-1)] < pivot
      // a[(j+1) ~ right] > pivot
      // ただし、お互いにpivotをswapすると、双方にpivotが混ざる
    } else
      break;
  }
  // 3条件を満たしている
  // a[i] >= pivot
  // a[j] <= pivot
  // i > j

  // i-1==rightにはならない  
  // i==leftが必ずa[i]<pivotを満たすため、i==j==rightでswapすることはない(要素数2以上)
  qsort(a, left, i-1);
  qsort(a, i, right);
")
(define code3-2 "
  int pivot = a[left];
  int i = left, j = right;
  while (1) {
    while(a[i] < pivot) i++;
    while(a[j] > pivot) j--;
    if (i <= j){
      swap(a, i, j); i++; j--;
    } else
      break;
  }
  // pivotがmaxのときに、pivot以下・以上で分割すると、２分割できていない場合がある
  // minのときは、ソートされているので問題ない?
  // i == j == leftでswapする可能性あり!
  // if there is a sorted array, j == left-1 maybe occur
  // prevent calling qsort(left, right) again
  if (left <= j) {
    qsort(a, left, j);
    qsort(a, j+1, right);
  }
")
(define code3-3 "
  int pivot = a[left];
  int i = left, j = right;
  while (1) {
    // この記述は危険. 必ずpivotが配列aの最大値のときにout of index
    // while(a[i] <= pivot) i++;
    while(a[i] <= pivot && i <= right) i++;
    while(a[j] >= pivot && j >= left ) j--;
    if (i <= j){
      swap(a, i, j); i++; j--;
    } else
      break;
  }
  if (i-1 < right)
    qsort(a, left, i-1);
  else {
    // pivotがmaxのため、これ一つと残りで２分割
    assert(i-1 == right);
    swap(a, left, right);
    qsort(a, left, right-1);
  }
  qsort(a, i, right);
")
(define code3-4 "
  int pivot = a[left];
  int i = left, j = right;
  while (1) {
    while(a[i] < pivot) i++;
    while(a[j] > pivot) j--;
    if (i < j){
      swap(a, i, j); i++; j--;
    } else
      break;
  }
  if (i==j) {
  // i == j && a[i] >= pivot && a[j] <= pivot
  // => a[i] == pivot
    assert(a[i] == pivot);
    qsort(a, left, i-1);
    qsort(a, i+1, right);
  } else {
    qsort(a, left, j);
    qsort(a, i, right);
  }
")

(define c-template "
#include <stdio.h>
#include <assert.h>
void swap(int *a, int x, int y) {
  int t = a[x];
  a[x] = a[y];
  a[y] = t;
}
void qsort(int *a, int left, int right) {
  if (left >= right)
    return;
~a
}
int main() {
  int a[] = {~a};
  int arr_size = sizeof(a)/sizeof(a[0]);
  qsort(a, 0, arr_size - 1);
  for (int i = 0; i < arr_size; i++)
    printf(\"%d, \", a[i]);
  return 0;
}
")

(p "O(nlogn)")
(p "O(n^2)")

(ps "c")
(c (format c-template code1 test1) :str #t)
(c (format c-template code2 test1) :str #t)
(c (format c-template code3 test1) :str #t)
(c (format c-template code3-1 test1) :str #t)
(c (format c-template code3-2 test1) :str #t)
(c (format c-template code3-3 test1) :str #t)

(ps "scheme")
(eval-null `(gosh ,#"
(define (quick-sort alist)
  (if (null? alist)
      '()
      (let* ((pivot (car alist))
             (rest (cdr alist))
             (small (filter (lambda (x) (<= x pivot)) rest))
             (large (filter (lambda (x) (> x pivot)) rest)))
        (append (quick-sort small) (list pivot) (quick-sort large)))))
(print  (quick-sort '~(to-i test1)))
" :str #t))
