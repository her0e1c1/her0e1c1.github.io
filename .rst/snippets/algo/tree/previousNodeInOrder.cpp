// IMPLEMENT: in-order traversalにおける前のnodeの求め方
#include <myutils.h>

LinkedList* traverse(LinkedList* tree) {
  if (tree->left) {
    LinkedList* child = tree->left;
    while (child->right)
      child = child->right;
    return child;
  } else {
    LinkedList* parent;
    LinkedList* child = tree;
    while ((parent = child->parent) != NULL) {
      if (parent->right == child)
        break;
      child = parent;
    }
    return parent;
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
  // cout << traverse(&n4)->value << endl;
  cout << traverse(&n2)->value << endl;
  cout << traverse(&n5)->value << endl;
  cout << traverse(&n1)->value << endl;
  cout << traverse(&n6)->value << endl;
  cout << (traverse(&n3) ? "NOT NULL" : "NULL") << endl;
}
