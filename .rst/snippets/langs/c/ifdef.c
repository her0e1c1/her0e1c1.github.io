#include <stdio.h>

// ifdef else endifはソースコードをコンパイルする前の前処理

// 以下の一文を明示する
// #define DEBUG

// あるいは、オプションを渡す(#define DEBUGと同じ効果)
// clang -DDEBUG ifdef.c

// 引数を渡さなかった場合はelseが呼ばれる
// clang ifdef.c

int main () {

#ifdef DEBUG
  printf("DEBUG");
#else
  printf("NOT DEBUG");
#endif

}
