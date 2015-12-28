(define test1 "1, 4, 45, 3, 7, 6, 7, 7, 7, 10, 8, 8, 8, 8, 1, 10, -1, 3, 20, 5, 9, 33, -1, 4,5,3,6 ")
(define to-i (^x (map (^y (x->integer (string-trim-both y))) (string-split x ","))))

(define code1 "
void qsort(int *a, int left, int right) {
  if (left >= right)
    return;
  int pivot = a[left];
  int k = left;
  // items from left+1 to k are smaller than pivot
  for (int i = left + 1; i <= right; i++) {
    if (a[i] < pivot) {
      k++;
      swap(a, k, i);
    }
  }
  swap(a, left, k);
  // items from left to k-1 are smaller than pivot
  qsort(a, left, k-1);
  qsort(a, k+1, right);
}
")

(define code2 "
void qsort(int *a, int left, int right) {
  if (left >= right)
    return;
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
}
")

(define c-template "
#include <stdio.h>
void swap(int *a, int x, int y) {
  int t = a[x];
  a[x] = a[y];
  a[y] = t;
}
~a
int main() {
  int A[] = {~a};
  int arr_size = sizeof(A)/sizeof(A[0]);
  qsort(A, 0, arr_size - 1);
  for (int i = 0; i < arr_size; i++)
    printf(\"%d, \", A[i]);
  return 0;
}
")


(ps "c")
(c (format c-template code1 test1) :str #t)
(c (format c-template code2 test1) :str #t)

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
