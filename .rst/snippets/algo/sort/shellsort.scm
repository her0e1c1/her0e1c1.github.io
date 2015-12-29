(define DATA1 (generator->list (integers$ 200 -100) 20))
(define (to-s x) (string-join (map x->string x) ", "))

(p "gap==1がinsert sort")

(p "分割したinsert sortというだけ")

(c #"
#include <stdio.h>
void sort(int *a, int len) {
 for (int gap = len/2; gap >= 1; gap/=2) {
  for (int i = gap; i < len; i += gap) {
    int j = i;    
    while (j-gap >= 0 && a[j] < a[j-gap]) {
       int tmp = a[j];
       a[j] = a[j-gap];
       a[j-gap] = tmp;
       j -= gap;
    }
  }
 }
}
int main() {
 int a[] = {~(to-s DATA1)};
 int len = sizeof(a)/sizeof(a[0]);
 sort(a, len);
 for (int i = 0; i < len; i++)
  printf(\"%d, \", a[i]);
}
"
   :msg "gap==1で最終的にソートされる"
   :str #t)

(c #"
#include <stdio.h>
void sort(int *a, int len) {
 for (int gap = len/2; gap >= 1; gap/=2) {
  for (int k = 0; k < gap; k++) {
    for (int i = k+gap; i < len; i += gap) {
    int j = i;
    while (j-gap >= 0 && a[j] < a[j-gap]) {
       int tmp = a[j];
       a[j] = a[j-gap];
       a[j-gap] = tmp;
       j -= gap;
    }
   }
  }
 }
}
int main() {
 int a[] = {~(to-s DATA1)};
 int len = sizeof(a)/sizeof(a[0]);
 sort(a, len);
 for (int i = 0; i < len; i++) printf(\"%d, \", a[i]);
}
"
   :msg "An array is divided to k-groups. apply insert sort to each group"
   :str #t)
