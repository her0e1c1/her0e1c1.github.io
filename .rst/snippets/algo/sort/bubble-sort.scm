// IMPLEMENT: bubble sort
#include <stdio.h>
#include <string.h>

// bubble sortは末尾からsortされる

// 1回目   : 0 <= j <= size - 1
// 2回目   : 0 <= j <= size - 2
// size回目: 0 <= j <= size - size = 0

void bsort(int *a, int size) {
  // jの終端を正しく記述できるかがポイント
  for (int end = size - 1; end >= 0 ; end--) {
    for (int j = 0; j <= end ; j++) {
      if (a[j + 1] < a[j]) {
        int t = a[j];
        a[j] = a[j+1];
        a[j+1] = t;
      }
    }
  }
}

int main() {
  // int A[] = {4, 1, 45, 6, 10, 8, 3};
  int A[] = {1, 4, 45, 3, 7, 6, 7, 7, 7, 10, 8, 8, 8, 8,
             1, 10, -1, 3, 20, 5, 9, 33, -1, 4,5,3,6};
  int arr_size = sizeof(A)/sizeof(A[0]);
  bsort(A, arr_size);
  for (int i = 0; i < arr_size; i++)
    printf("%d, ", A[i]);
  return 0;
}


;; bubbleSort :: Ord a => [a] -> [a]
;; bubbleSort xs = case sort xs of
;;   (x:xs) -> x:bubbleSort xs
;;   x      -> x
;;   where
;;   sort (x:y:zs)
;;     | x < y     = y:sort (x:zs)
;;     | otherwise = x:sort (y:zs)   sort x = x

;;  (define (descend l a)
;;    (if (or (null? l) (< a (car l)))
;;        (cons a l)
;;        (cons (car l) (descend (cdr l) a))))

;; ; 一つ前のソート済みの配列に、合致する位置に挿入
;; ; f(n) = (descend f(n-1) a)
;; (define (bubble-sort l)
;;   (if (null? l) l
;;       (descend (bubble-sort (cdr l)) (car l))))
