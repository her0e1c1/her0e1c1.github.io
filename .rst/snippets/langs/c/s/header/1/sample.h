#ifndef SAMPLE
#define SAMPLE

#include <stdio.h>

struct node {
  int value;
  struct node* next;
};
typedef struct node node_t;

extern void printNode();

// implicitly extern
int main_print();

// 明示的にこの宣言をすることで、このヘッダをinluceしたファイルは
// この関数を使用することができる
extern int add(int, int);
// 実際は宣言しなくても、警告はでるが、
// staticでない宣言の関数はグローバルに定義されているので参照できる

// externを付けた変数は外部定義の変数を参照するので初期化はできない(仮定義)
extern int GLOBAL_VAR;

#endif
