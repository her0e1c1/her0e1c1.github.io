
(p "引数が@_に格納されてるので、そのどれかを取り出す感じ")
(perl "sub {print $_[rand @_] for 1 .. 255}->(\"a\" .. \"z\", 0 .. 9, \"A\" .. \"Z\")")
(perl "sub {print \"@_\"}->(\"a\" .. \"z\", 0 .. 9, \"A\" .. \"Z\")")

(cpp "[](){ cout << \"hello world\" << endl; }();")
(cpp "[]{ cout << \"hello world\" << endl; }();")

(zsh "(){echo 'hello'}" :msg "関数定義しただけでなく、実行もされる")

(sh "a(){ echo \"$1\";}; a 'hello world'"
    :warn "sh/bashは、匿名関数使えない. 仕方がないので1回呼ぶので対応")



;; // return忘れない。最後にセミコロン必要
;; #include "myutils.h"
;; int main() {
;;   function<long(int)> fact = [&] (int n){ return (n==1) ? 1L : n * fact(n-1); };
;;   P(fact(5));
;; }

;; /*
;; [] don't capure anything

;; Bellow you can use closure

;; [&] capture-by-reference

;; [=] capture-by-value (copy)
;; */

;; int main()
;; {
;;   // lambdaは以下の項目からなる
;;   // 型 変数 = [キャプチャ] (シグニチャ) {本体};
;;   // [キャプチャ] (シグニチャ) {本体} (関数呼び出し);
;;   [](){ cout << "hello world" << endl; }();

;;   // []の場合は外側の変数を参照しないが、
;;   // fact自体を参照する必要があるので&が必要
;;   function<long(int)> fact = [&] (int n){
;;     if (n == 1)
;;       return 1L;
;;     return n * fact(n - 1);
;;   };  //最後にセミコロンが必要
;;   P(fact(10));

;;   // 型を明示するのが面倒ならauto
;;   auto not_fact = [&] (int n) {
;;     if (n == 1)
;;       return 1L;
;;     // 型がautoなので関数の戻り値がコンパイラでは分からない
;;     // return (long)n * not_fact(n - 1);
;;     return (long)n;
;;   };
;;   P(not_fact(10));

;;   // int N = 1;
;;   // auto l1 = [=](){
;;   //   N = 2;  // コピーを書き換えようとするのでコンパイルエラー
;;   //   P(N);
;;   // };
;;   // l1();
;;   // P(N);

;;   int N2 = 1;
;;   auto l2 = [&](){
;;     N2 = 2;  // 参照先を書き換える
;;   };
;;   l2();
;;   P(N2);

;;   int N3 = 1;
;;   auto l3 = [=]() mutable{
;;     N3 = 2;  // コピーの変数を書き換える
;;   };
;;   l2();
;;   P(N3);  // コピー元は書き変わらない

;;   // こっちはOK
;;   function <void(vector<int>)>f2 = [&] (const vector<int> & n) {
;;     P("f1");
;;   };

;;   // 型がそろってないのでエラー
;;   // function <void(vector<int>)>f2 = [&] (vector<int> & n) {
;;   //   P("f2");
;;   // };

;;   function <void(vector<int>)>f3 = [&] (vector<int> n) {
;;     P("f3");
;;   };

;;   return 0;
;; }
