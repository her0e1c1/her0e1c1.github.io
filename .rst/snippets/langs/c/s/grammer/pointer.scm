
#include <stdio.h>

// WARN: *A->Bの評価のされ方は、*(A->B)となる

void test_1() {
  // *A->Bは、*(A->B)と評価
  // つまり、A->Bは、Bのpointerを表す
  printf("test *A->B\n");

  typedef struct _t {int* B;} t;
  int value = 1;
  t data;
  data.B = &value;
  t* A = &data;
  printf("%d == %d\n", *A->B, *(A->B));
}

void test_2() {
  // (*A)->Bは、pointer->Bと評価(Bの値が返る)
  // **A = &pointer (つまり、Aはpointerのpointer)
  printf("test (*A)->B\n");

  typedef struct _t {int B;} t;
  t data;
  data.B = 1;
  t* pointer = &data;
  t** A = &pointer;
  printf("%d\n", (*A)->B);
}

int main() {
  test_1();
  test_2();
}
