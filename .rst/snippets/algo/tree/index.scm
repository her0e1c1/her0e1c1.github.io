
;; // IMPLEMENT: 木構造がbalancedであるか判定する
;; // balancedとは、どの2つのleafからrootまでのpathが同じ

;; #include <iostream>
;; #include <stack>
;; #include <vector>
;; #include "node.h"

;; using namespace std;

;; class Tree {

;; public:
;;   int value;
;;   Tree* parent;
;;   // vector<Tree>* ではない!
;;   vector<Tree*> children;

;;   Tree(int value, Tree* parent = NULL) {
;;     this->value = value;
;;     this->parent = parent;
;;     if (parent)
;;       (*parent).children.push_back(this);
;;   }

;;   void append(vector<int> values) {
;;     for (int i: values)
;;       // Tree(i, this);は不可(local変数は関数が返ったときに破棄される)
;;       new Tree(i, this);
;;   }

;;   int maxDepth() {
;;     if (isLeaf()) {
;;       return 1;
;;     }

;;     int max = 0;
;;     for (Tree* t: children) {
;;       int d = (*t).maxDepth();
;;       if (max < d)
;;         max = d;
;;     }
;;     return max + 1;
;;   }

;;   int minDepth() {
;;     if (isLeaf())
;;       return 1;

;;     int min = 100000;
;;     for (Tree* t: children) {
;;       int d = (*t).minDepth();
;;       if (min > d)
;;         min = d;
;;     }
;;     return min + 1;
;;   }

;;   bool isLeaf() {
;;     return children.empty();
;;   }

;;   bool isBalanced() {
;;     if (isLeaf())
;;       return true;

;;     return maxDepth() - minDepth() <= 1;
;;   }

;; };

;; int main(){
;;   Tree root(0);
;;   Tree t1(1, &root), t2(2, &root);
;;   Tree t3(3, &t1);
;;   t1.append((vector<int>){10});
;;   t2.append((vector<int>){1,2,3});
;;   cout << root.isBalanced() << endl;
;; }
