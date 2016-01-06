// IMPLEMENT: Lowest Common Ancestor Without Addtional Memory (CI tree.6)
#include "myutils.h"

bool hasNode(BinaryTree* tree, BinaryTree* target) {
  if (tree == NULL)
    return false;
  if (tree == target)
    return true;
  return hasNode(tree->left, target) || hasNode(tree->right, target);
}

// rootから順にa,bを持つかどうか調べる
BinaryTree* traverse(BinaryTree* tree, BinaryTree* a, BinaryTree* b) {
  if (tree == NULL)
    return NULL;
  if (hasNode(tree->left, a) && hasNode(tree->left, b))
    return traverse(tree->left, a, b);
  else if (hasNode(tree->right, a) && hasNode(tree->right, b))
    return traverse(tree->right, a, b);
  return tree;
}

int main(){
  BinaryTree n8 = BinaryTree(8);
  BinaryTree n4 = BinaryTree(4, &n8);
  BinaryTree n5 = BinaryTree(5);
  BinaryTree n6 = BinaryTree(6);
  BinaryTree n3 = BinaryTree(3, &n6);
  BinaryTree n2 = BinaryTree(2, &n4, &n5);
  BinaryTree n1 = BinaryTree(1, &n2, &n3);
  cout << traverse(&n1, &n4, &n5)->value << endl;  // 2
  cout << traverse(&n1, &n4, &n8)->value << endl;  // 4
  cout << traverse(&n1, &n4, &n6)->value << endl;  // 1
}
