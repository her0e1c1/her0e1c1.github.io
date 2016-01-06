(ps "Lowest Common Ancestor (ORDER=O(n))")
(p "pathをキャッシュする")

(define main$ (pa$ format #!Q
#include <mystruct.h>
#include <myutils.h>
~a
int main(){
 #define i(a) btree *n ## a = btree_init(a);
 #define a btree_append
 #define E(a, b) printf("%d, %d => %d\n", a->data, b->data, (traverse(n1, a, b) == NULL) ? -1 : traverse(n1, a, b)->data);
 i(1); i(2); i(3); i(4); i(5); i(6);
 a(n1, a(n2, n4, n5), a(n3,n6, NULL));
 btree_print(n1, 0); 
 E(n4, n5);
 E(n4, n6);
 E(n2, n6);
}
Q))

(cpp (main$ #!Q
btree *traverse(btree *DUMMY, btree *a, btree *b) {
  vector<btree*>paths;
  while(a) {
    paths.push_back(a);
    a = a->parent;
  }
  while (b) {
    if (find(paths.begin(), paths.end(), b) == paths.end())
      b = b->parent;
    else
      return b;
  }
  return NULL;
}
Q) :str #t)

(ps "Lowest Common Ancestor Without Addtional Memory (CI tree.6)")
(p "rootから順にa,bを持つかどうか調べる")

(cpp (main$ #!Q
int hasNode(btree *tree, btree *target) {
  if (tree == NULL)
    return FALSE;
  if (tree == target)
    return TRUE;
  return hasNode(tree->left, target) || hasNode(tree->right, target);
}
btree *traverse(btree *tree, btree *a, btree *b) {
  if (tree == NULL)
    return NULL;
  if (hasNode(tree->left, a) && hasNode(tree->left, b))
    return traverse(tree->left, a, b);
  else if (hasNode(tree->right, a) && hasNode(tree->right, b))
    return traverse(tree->right, a, b);
  return tree;
}
Q) :str #t)
