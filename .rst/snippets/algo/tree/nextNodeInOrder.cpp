// IMPLEMENT: in-order traversalにおける次のnodeの求め方 (CI tree.5)
#include <myutils.h>

/*
  in-orderにおける次を求めたい

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
   ただし一つ目だけわかればよいので、if tree.rightなどは不要)

  def traverse(tree):
      if tree.left:
          traverse(tree.left)
      return tree  # do return!

  rightがない場合は、親をたどるが、以下のいずれかから関数が返る
  traverse(tree.left)
  traverse(tree.right)
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
*/

LinkedList* traverse(LinkedList* tree) {
  if (tree == NULL)
    return NULL;
  if (tree->right) {
    LinkedList* n = tree->right;
    while (n->left) {
      n = n->left;
    }
    return n;
  } else {
    LinkedList* n = tree;
    while (n->parent && n->parent->left != n) {
      n = n->parent;
    }
    return n->parent;
  }
}

int main(){
  LinkedList n4 = LinkedList(4);
  LinkedList n5 = LinkedList(5);
  LinkedList n6 = LinkedList(6);
  LinkedList n3 = LinkedList(3, &n6);
  LinkedList n2 = LinkedList(2, &n4, &n5);
  LinkedList n1 = LinkedList(1, &n2, &n3);

  // 4 -> 2 -> 5 -> 1 -> 6 -> 3
  cout << traverse(&n4)->value << endl;
  cout << traverse(&n2)->value << endl;
  cout << traverse(&n5)->value << endl;
  cout << traverse(&n1)->value << endl;
  cout << traverse(&n6)->value << endl;
  cout << (traverse(&n3) ? "NOT NULL" : "NULL") << endl;
}
