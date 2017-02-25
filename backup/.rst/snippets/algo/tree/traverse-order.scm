(ps "in-order traversalにおける次のnodeの求め方 (CI tree.5)")

(p"
in-orderにおける次を求めたい :: 

    def traverse(tree):
        if tree.left:
            traverse(tree.left)
        # do something
        if tree.right:
            traverse(tree.right)

コードから読み取れること (#doした後、次どこか考える)
すでに#doしているので、rightがあれば、
次のnodeは traverse(tree.right) ではじめに# doするnodeとなる
(#do以外は同じコードを流用できるのがミソ、
ただし一つ目だけわかればよいので、if tree.rightなどは不要) ::

    def traverse(tree):
        if tree.left:
            traverse(tree.left)
        return tree  # do return!

rightがない場合は、親をたどるが、以下のいずれかから関数が返る
- traverse(tree.left)
- traverse(tree.right)
leftから戻ってきた場合は#doをするので、親が次のnodeとなる
rightから戻った場合、再度親をたどる(再帰)

rightから常に戻ってくる場合は、次のnodeがないことになる

in-orderの場合, left mid rightの順
mid => rightと評価されているので、親をたどるときに、
right側であれば、それはすでにmidで評価されているものになる
left側からの場合は、すぐにmidを評価してよい(l => m => rの順だからね)

コードから判断は、なんかよくわかんないけど
図にすれば、in-orderのpreバージョンも条件逆にするだけってのがよくわかる
とにかく、左子供から帰ってきたら、次親の真ん中だね
")

(c #!Q
#include <mystruct.h>
btree *traverse(btree *tree) {
  if (tree == NULL)
    return NULL;
  if (tree->right) {
    btree *n = tree->right;
    while (n->left)
      n = n->left;
    return n;
  } else {
    btree *n = tree;
    while (n->parent && n->parent->left != n)
      n = n->parent;
    return n->parent;
  }
}

int main(){
 #define i(a) btree *n ## a = btree_init(a);
 #define a btree_append
 #define E(n) printf("%d => %d\n", n->data, (traverse(n) == NULL) ? -1 : traverse(n)->data);
 i(1); i(2); i(3); i(4); i(5); i(6);
 a(n1, a(n2, n4, n5), a(n3,n6, NULL));
 btree_print(n1, 0); 
 E(n4); E(n2); E(n5); E(n1); E(n6); E(n3);
}
Q :str #t)

(ps "in-order traversalにおける前のnodeの求め方")
(c #!Q
#include <mystruct.h>
btree *traverse(btree *tree) {
  if (tree->left) {
    btree *child = tree->left;
    while (child->right)
      child = child->right;
    return child;
  } else {
    btree *n = tree;
    while (n->parent && n->parent->right != n)
     n = n->parent;
    return n->parent;
  }
}
int main() {
 #define i(a) btree *n ## a = btree_init(a);
 #define a btree_append
 #define E(n) printf("%d => %d\n", n->data, (traverse(n) == NULL) ? -1 : traverse(n)->data);
 i(1); i(2); i(3); i(4); i(5); i(6);
 a(n1, a(n2, n4, n5), a(n3,n6, NULL));
 btree_print(n1, 0); 
 E(n3); E(n6); E(n1); E(n5); E(n2); E(n4);
}
Q :str #t)
