
(p "pointerを受け取ったときはNULLチェックを忘れない
原則はじめにガードする")

(p"
void t(node_t* node) {
  // node->value としていいのは、nodeがNULLでないことを確認した後
  if (node != NULL) {
    // この中では、node->valueと参照してよい
    // node->nextも同様
  }
}

void t2(node_t* node) {
  // node->next->value としていいのは、以下の条件
  if (node != NULL && node->next != NULL) {
    // この中では、node->next->valueと参照してよい
  }
}
")

;; carを参照することは正しい
;; cdrを参照することは、毎回正しくはない
;; つまり、[1]を参照するくらいなら、[0]の方が良い

;; ってことは、関数の引数に毎回[1:]をしたcdrでなくて
;; carを関数の引数に渡しても良い！

;; 状態を変える（関数を変える）ことはcarで行う方が良い！
