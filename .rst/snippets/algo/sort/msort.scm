(p "O(2n)")
(p "O(nlogn) stable")

(define code1 "
  int mid = left + (right - left) / 2;
  msort(a, left, mid);
  msort(a, mid + 1, right);

  int l = left, r = mid + 1, k = 0;
  int len = right - left + 1;
  int buff[len];  // O(n)のスペースが必要(VLA)

  // どちらか一方の配列を全て使い切るまでloop
  while (l <= mid && r <= right) {
    if (a[l] < a[r])
      buff[k++] = a[l++];
    else
      buff[k++] = a[r++];
  }
  // 残りの一方の配列をappend
  while (l <= mid)   buff[k++] = a[l++];
  while (r <= right) buff[k++] = a[r++];

  // sizeof忘れ、offsetのleft忘れ
  memcpy(a + left, buff,  sizeof(int) * len);
  /* for (int i = 0; i < len; i++) */
  /*   a[left + i] = buff[i]; */
")

(define c-template #!DOC EOS
#include <stdio.h>
#include <string.h>

void msort(int *a, int left, int right) {
  if (left >= right)
    return;
~a
}

int main() {
  int A[] = {1, 4, 45, 3, 7, 6, 7, 7, 7, 10, 8, 8, 8, 8,1, 10, -1, 3, 20, 5, 9, 33, -1, 4,5,3,6};
  int arr_size = sizeof(A)/sizeof(A[0]);
  msort(A, 0, arr_size - 1);
  for (int i = 0; i < arr_size; i++)
    printf("%d, ", A[i]);
  return 0;
}
EOS
)
(c (format c-template code1) :str #t)


(ps "scheme")
(eval-null `(gosh ,#"
(define (merge-sort alist)
  (if (>= 1 (length alist))
      alist
      (let1 mid (div (length alist) 2)
            (merge (merge-sort (take alist mid)) (merge-sort (drop alist mid))))))
(define (merge l r)
  (cond ((null? l) r)
        ((null? r) l)
        (else
         (let ((la (car l)) (ra (car r)))
           (if (< la ra)
               (cons la (merge (cdr l) r))
               (cons ra (merge l (cdr r))))))))
(print (merge-sort '(1 4 1 5 2 3 1)))
" :str #t))


;; split :: [a] -> ([a], [a])
;; split (x:y:zs) = (x:xs, y:ys) where (xs, ys) = split zs
;; split xs = (xs, [])

;; mergesort :: (a -> a -> Bool) -> [a] -> [a]
;; mergesort pred []  = []
;; mergesort pred [x] = [x]
;; mergesort pred x   = merge (mergesort pred a) (mergesort pred b) where
;;   (a, b) = split x
;;   merge xs [] = xs
;;   merge [] ys = ys
;;   merge xxs@(x:xs) yys@(y:ys)
;;     | pred x y  = x:merge xs yys
;;     | otherwise = y:merge xxs ys
