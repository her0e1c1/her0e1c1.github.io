
(c #!Q
#include "myc.h"
// &"Hello" のプッシュがスタックオーバーフローとなる
int main() {
  int n[1000000000];  // 配列が大きすぎる
  printf("Hello");
}
Q :str #t
:warn "スタックに巨大な配列をセットしない")

(c #!Q
// この場合は、以下のように配列を静的領域に移動するか、
#include "myc.h"
int n[1000000000];
int main() {
  printf("Hello");
}
Q :str #t)

(c #!Q
// malloc などを使ってヒープ領域に確保すればスタックオーバーフローは回避できる。
#include "myc.h"
int main() {
  int *n = malloc(sizeof(int) * 1000000000);
  printf("Hello");
  free(n);
}
Q :str #t)
