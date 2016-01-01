
(ps "k-roteated increasing order array")

(p"
-- A -- left -- B -- mid -- C -- right -- D --

本来 left <= mid <= rightが成立する
ただし、lotateしているため、その開始位置がmidの右か左か特定する必要がある。

a[left] < a[mid]のときは、左側が順番に並んでいるので、Cに開始位置がある.
leftとmidの間にtargetがあるか、ないかで区間を狭めることができる。
")


(define template "
#include <stdio.h>
int search(int *a, int left, int right, int target) {
  while (left <= right) {
    int mid = left + (right - left) / 2;
    if (a[mid] == target)
      return mid;
    else if (a[left] > a[mid]) {
      if (a[mid] <= target && target <= a[right])
        left = mid + 1;
      else
        right = mid - 1;
    } else {
      if (a[left] <= target && target <= a[mid])
        right = mid - 1;
      else
        left = mid + 1;
    }
  }
  return -1;
}
int main() {
  int A[] = {~a};
  int arr_size = sizeof(A)/sizeof(A[0]);
  for (int i = 0; i <= 9; i++)
    printf(\"%d, \", search(A, 0, arr_size - 1, i));
  return 0;
}
")

(p (sphinx-block (format template "/* TEST-DATA */") :code-block "c"))
(define-macro (output array)
  (let1 s (string-join (map x->string array) ", ")
  `(begin
     (p "TEST-DATA = " ,s)
     (c (format template ,s) :str #t :result-only #t))))

(define (rotate list n)
  (append (drop list n) (take list n)))

(eval-null
 `(begin
    ,@(map (^x `(output ,(rotate (iota 10) x))) (iota 3))))

(let1 s "2,2,2,2,2,2,2,3,2,2"
      (p "TEST-DATA = " s)
      (c (format template s)
         :result-only #t
         :str #t
         :msg "linerでなくても求まる!"))
