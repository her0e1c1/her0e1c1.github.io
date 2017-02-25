
(ps "find the start point of a cycled list")

(p "
循環リストは以下のようなもの (startは円外の端)
(start)----------
            |___|
円の開始位置を結果として返す問題

速度が1と2のかめとうさぎを考える
startから円の開始位置までの距離をkとおくと
かめがk進んだときに、ウサギはk(mod=n)の位置にいる
このとき、ウサギからみたかめの位置はn - k(mod=n)先にいることになる
速度差は1なので、n-k(mod=n)だけかめが移動した位置で合流する
合流位置から開始までの距離は、n - (n-k(mod=n)) = k(mod=n)となる
かめをスタート位置に戻し、k(mod=n)だけ進めると（うさぎもここからは速度1）
うさぎは開始位置に到着(nごとに開始位置へ戻る)
k - k(mod=n) = nの倍数 (kをnで割った余りをk(mod=n)と置いた.kからその余りを引けば、それはnの倍数)
よって、開始位置で合流できる
")


(c #!Q
#include <myc.h>
#include <mystruct.h>

list_t* find(list_t* node) {
  if (node == NULL)
    return NULL;

  list_t *fast, *slow;
  fast = slow = node;

  // find a point where both of two meet
  while (fast->next) {
    slow = slow->next;
    fast = fast->next->next;
    if (slow == fast)
      break;
  }

  // node is not cycled
  if (fast->next == NULL)
    return NULL;

  slow = node;
  while (slow != fast) {
    slow = slow->next;
    fast = fast->next;
  }
  return slow;
}
int main() {
  list_t *n1 = inits(7, 0, 1, 2, 3, 4, 5, 6);
  indexAt(n1, 6)->next = indexAt(n1, 3);
  printf("start at %d\n", find(n1)->data);
}
Q :str #t)
