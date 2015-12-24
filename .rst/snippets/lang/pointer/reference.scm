

;; #include <iostream>

;; using namespace std;

;; // reference(参照)は、変数の実体をそのまま受け取る
;; // 表記の違い程度に考えておけばOK

;; // references are syntactic sugar of pointer

;; // C++で referenceが多用されているのは
;; // 一度初期化したあとはその指すアドレスを変更できない、かつ
;; // 参照は必ずどこか実際のインスタンスとなる変数を指していなければならないため
;; // NULL checkが回避できることみたい
;; // int &a;  // error
;; // int *a;  // no error

;; void f(int& q) {
;;   cout << q << endl;
;; }

;; void g(int* q) {
;;   cout << *q << endl;
;; }

;; int main() {
;;   int p;
;;   p = 1; 
;;   int& q = p;
;;   cout << q << endl;

;;   // pointer/referenceの引数への渡し方
;;   f(p);
;;   g(&p);

;;   // 基本型は上書きできるみたい?
;;   int pp;
;;   pp = 2;
;;   // &q = pp; // complie error
;;   q = pp;
;;   cout << q << endl;
;;   f(p);
;;   g(&p);
  
;; }
