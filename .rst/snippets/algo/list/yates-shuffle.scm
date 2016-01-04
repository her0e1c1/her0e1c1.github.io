(p "末尾と取り替えるインデックスを決めて、それと末尾を入れ替え")

(c #!Q
#include <myc.h>
void swap(int *x, int *y) { int t=*x; *x=*y; *y=t; }
void shuffle(int *a, int size) {
 for (int i = size - 1; i >= 1; i--) {
   int j = rand() % (i + 1);
   assert (0 <= j && j <= i);
   swap(&a[i], &a[j]);
 }
}
int main() {
 srand(time(NULL));
 int a[] = {1,2,3,4,5};
 shuffle(a, SIZE(a));
 PVI(a);
}
Q :str #t)
