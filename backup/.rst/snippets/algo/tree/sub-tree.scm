
(p "return true If a sub tree is a part of the parent tree")
; large とあるが、これは余計なspaceを使わないという意味
; メモリ上では収まることを仮定してよい
(c #!Q
#include <mystruct.h>
#include <myc.h>
int matchTree(btree *a, btree *b) {
  if (a == NULL && b == NULL)
      return TRUE;
  else if (a && b && a->data == b->data) {
    return (matchTree(a->left, b->left) &&
            matchTree(a->right, b->right));
  }
  return FALSE;
}
int subTree(btree *tree, btree *sub) {
  if (sub == NULL)
    return TRUE;
  if (tree == NULL)
    return FALSE;
  if (matchTree(tree, sub))
    return TRUE;
  return subTree(tree->left, sub) || subTree(tree->right, sub);
}
int main(){
 #define i(a) btree *n ## a = btree_init(a);
 #define I(a) btree_init(a)
 #define a btree_append
 #define E(a, b) printf("%d, %d => %d\n", a->data, b->data, subTree(a, b));
 i(1); i(2); i(3); i(4); i(5); i(6);
 a(n1, a(n2, n3, a(n4, n5, n6)), a(I(3), I(6), NULL));
 btree_print(n1, 0); 
 E(n4, I(6));
 E(n1, a(I(2), I(3), a(I(4), I(5), I(6))));
 E(n1, a(I(4), I(5), I(6)));
 E(n1, a(I(4), NULL, I(6)));
 E(n1, a(I(1), a(I(2), I(3), a(I(4), I(5), I(6))), NULL));
}
Q :str #t)
