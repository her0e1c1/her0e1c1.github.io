(ps "check the tree is balanced")
(p "balanced means any two leaf have the same length form root")

(c #!Q
#include <mystruct.h>
int maxDepth(btree *node) {
 if (node == NULL) return 0;
 return 1 + MAX(maxDepth(node->left), maxDepth(node->right));
}
int minDepth(btree *node) {
 if (node == NULL) return 0;
 return 1 + MIN(minDepth(node->left), minDepth(node->right));
}
int isBalanced(btree *root) {
  return (maxDepth(root) - minDepth(root)) == 0;
}
int main() {
 #define i btree_init
 #define a btree_append
 #define b(x,y,z) a(i(x), i(y), i(z))
 #define E(n) btree_print(n, 0); printf("=> %s\n", isBalanced(n) ? "OK" : "NO");
 E(a(i(1), b(1,2,3), b(1,2,3)));
 E(a(i(1), b(1,2,3), a(i(1),i(2),b(3,4,5))));
 E(i(1));
}
Q :str #t)
