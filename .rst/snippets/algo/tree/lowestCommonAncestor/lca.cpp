// IMPLEMENT: Lowest Common Ancestor (ORDER=O(n))
#include "myutils.h"

// pathをキャッシュする
BinaryTree* traverse(BinaryTree* tree, BinaryTree* a, BinaryTree* b) {
  vector<BinaryTree*> paths;
  while (a) {
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
