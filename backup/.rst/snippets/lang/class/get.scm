
(c #!DOC EOS
#include <stdio.h>
int main() {
  typedef struct _t {int* B;} t;
  int value = 1;
  t data;
  data.B = &value;
  t* A = &data;
  printf("%d == %d\n", *A->B, *(A->B));
}
EOS
:msg "*A->Bの評価のされ方は、*(A->B)となる. つまり、A->Bは、Bのpointerを表す(->の方が結合力ある)"
:str #t
)

(c #!DOC EOS
#include <stdio.h>
int main() {
  typedef struct _t {int B;} t;
  t data;
  data.B = 1;
  t* pointer = &data;
  t** A = &pointer;
  printf("%d\n", (*A)->B);
  // printf("%d\n", *A->B);
}
EOS
:msg "(*A)->Bは、pointer->Bと評価(Bの値が返る). **A = &pointer (つまり、Aはpointerのpointer)"
:str #t
)

